    clear
    clc

    %% create symbolic variables

    syms x1 real;                                                             
    syms x2 real;                                                              
    syms m1 real;                                                             
    syms m2 real;                                                               
    syms x1dot real;                                                           
    syms x2dot real;                                                            
    syms x1ddot real;                                                         
    syms x2ddot real;  
    syms k1 real;                                                              
    syms k2 real;                                                             
    syms c1 real;
    syms c2 real;
    T = 0.5*(m1*x1dot^2 + m2*x2dot^2 );
    U = 0.5*(k1*x1^2 + k2*(x2 - x1)^2 );
    D = 0.5*(c1*x1dot^2 + c2*(x2dot- x1dot)^2); 
    L = T - U;
    dL_dx1dot = diff(L, x1dot);                                                 
    d_dtdl_dx1dot = diff(dL_dx1dot,x1dot)*x1ddot;                               
    dD_dx1dot = diff(D, x1dot);
    dL_dx2dot = diff(L, x2dot);                                                 
    d_dtdl_dx2dot = diff(dL_dx2dot,x2dot)*x2ddot;                              
    dD_dx2dot = diff(D, x2dot);                           
    dL_dx1 = diff(L, x1);                                                       
    dL_dx2 = diff(L, x2);
    Eqn1 = d_dtdl_dx1dot - dL_dx1+dD_dx1dot                                           
    Eqn2 = d_dtdl_dx2dot - dL_dx2+dD_dx2dot                                          








