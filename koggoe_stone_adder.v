`timescale 1ns / 1ps
module koggoe_stone_adder#(parameter n=64)(
       input [n-1:0]a,b,
       input cin,
        output [n-1:0]g,      //sum 
        output [n:0]h,        //concartinated carry and sum
        output c              //carry
       );

  wire [n-1:0]m,w;             // n-1  half adder
  wire  [n-1:1]x,y;            // first stage  output
  wire  [n-1:2]u,v;            // second stage output
  wire   [n-1:4]j,k;           // third stage output
  wire   [n-1:8]p,q;           // fourth stage output
  wire   [n-1:16]z,l;          // fifth stage output
  wire   [n-1:32]s,t;          // sixth stage output
  wire   [n-1:0]su;            // sum output
 genvar i;
 generate
      for(i=0;i<=n-1;i=i+1)
         begin
              p p0(a[i],b[i],m[i],w[i]);                  //instantiate half adder module                         
             if(i==0)                       
                   assign su[i]=cin^m[i];   
             else                   
                   begin

                          // first stage  output

                        q q0(m[i-1],m[i],w[i],w[i-1],x[i],y[i]);        //instantiate carry propagation and generation module            
                           if(i==1)
                             begin
                               assign su[i]=m[i]^w[i-1];         
                             end  
                          // second stage output                            
                         if(i>1)                                      
                              begin
                                  if(i==2)
                                         begin
                                        q q1(m[i-2],x[i],y[i],n[i-2],u[i],v[i]);     //instantiate carry propagation and generation module  
                                          assign su[i]=m[i]^y[i-1];
                                         end
                                  else
                                         begin
                                           q q2(x[i-2],x[i],y[i],y[i-2],u[i],v[i]);   //instantiate carry propagation and generation module  
                                             if(i==3)
                                                assign su[i]=m[i]^v[i-1];
                                          end
                                  // third stage output
                                  if(i>3)
                                      begin
                                                 if(i==4)
                                                    begin
                                                      q q3(m[i-4],u[i],v[i],n[i-4],j[i],k[i]);     //instantiate carry propagation and generation module  
                                                      assign su[i]=m[i]^v[i-1];
                                                    end
                                                  else if(i==5)
                                                     begin
                                                       q q4(x[i-4],u[i],v[i],y[i-4],j[i],k[i]);     //instantiate carry propagation and generation module  
                                                       assign su[i]=m[i]^k[i-1];
                                                     end
                                                  else
                                                     begin
                                                       q q5(u[i-4],u[i],v[i],v[i-4],j[i],k[i]);      //instantiate carry propagation and generation module  
                                                       assign su[i]=m[i]^k[i-1];
                                                     end
                                      // fourth stage output

                                         if(i>7)
                                             begin                                                        
                                                if(i==8)
                                                   begin     
                                                      q q6(m[i-8],j[i],k[i],n[i-8],p[i],q[i]);       //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^k[i-1];
                                                   end
                                                else if(i==9)
                                                   begin     
                                                      q q7(x[i-8],j[i],k[i],y[i-8],p[i],q[i]);       //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^q[i-1];
                                                   end
                                                else if((i==10) || (i==11))
                                                   begin     
                                                      q q8(u[i-8],j[i],k[i],v[i-8],p[i],q[i]);        //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^q[i-1];
                                                   end
                                                else
                                                   begin     
                                                      q q9(j[i-8],j[i],k[i],k[i-8],p[i],q[i]);        //instantiate carry propagation and generation module  
                                                      assign su[i]=m[i]^q[i-1];
                                                   end
                                            // fifth stage output
                                               if(i>15)
                                             begin                                                        
                                                if(i==16)
                                                   begin     
                                                      q q10(m[i-16],p[i],q[i],n[i-16],z[i],l[i]);      //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^q[i-1];
                                                   end
                                                else if(i==17)
                                                   begin     
                                                      q q11(x[i-16],p[i],q[i],y[i-16],z[i],l[i]);      //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^l[i-1];
                                                   end
                                                else if((i==18) || (i==19))
                                                   begin     
                                                      q q12(u[i-16],p[i],q[i],v[i-16],z[i],l[i]);       //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^l[i-1];
                                                   end
                                                else if((i>=20) && (i<=23))
                                                   begin     
                                                      q q13(j[i-16],p[i],q[i],k[i-16],z[i],l[i]);       //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^l[i-1];
                                                   end
                                                else
                                                   begin     
                                                      q q14(p[i-16],p[i],q[i],q[i-16],z[i],l[i]);       //instantiate carry propagation and generation module  
                                                      assign su[i]=m[i]^l[i-1];
                                                   end
                                          // sixth stage output
                                           if(i>31)
                                             begin                                                        
                                                if(i==32)
                                                   begin     
                                                      q q10(m[i-32],z[i],l[i],n[i-32],s[i],t[i]);      //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^l[i-1];
                                                   end
                                                else if(i==33)
                                                   begin     
                                                      q q11(x[i-32],z[i],l[i],y[i-32],s[i],t[i]);       //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^t[i-1];
                                                   end
                                                else if((i==34) || (i==35))
                                                   begin     
                                                      q q12(u[i-32],z[i],l[i],v[i-32],s[i],t[i]);       //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^t[i-1];
                                                   end
                                                else if((i>=36) && (i<=39))
                                                   begin     
                                                      q q13(j[i-32],z[i],l[i],k[i-32],s[i],t[i]);       //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^t[i-1];
                                                   end
                                                 else if((i>=40) && (i<=47))
                                                   begin     
                                                      q q13(p[i-32],z[i],l[i],p[i-32],s[i],t[i]);       //instantiate carry propagation and generation module  
                                                      assign  su[i]=m[i]^t[i-1];
                                                   end
                                                else
                                                   begin     
                                                      q q14(z[i-32],z[i],l[i],l[i-32],s[i],t[i]);        //instantiate carry propagation and generation module  
                                                      assign su[i]=m[i]^t[i-1];
                                                   end
                                             end
                                            end
                                         end
                                     end 
                                end                        
                    end                 
           end
  endgenerate 
assign g=su;
assign h={c,g};              // concartinated sum
assign c=(n>32)?t[n-1]:((n>16)?l[n-1]:((n>8)?q[n-1]:((n>4)?k[n-1]:v[n-1])));  //selecting the particular carry bit of n-stages
endmodule

module p(             //half adder module
      input a,b,
      output s,c
      );
  assign s=a^b;
  assign c=a&b;
endmodule
module q(             //carry propagation and generation module
      input a,b,g,f,
      output s,c
      );
  assign s=a&b;
  assign c=g|(b&f);
  endmodule