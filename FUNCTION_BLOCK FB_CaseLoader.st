FUNCTION_BLOCK FB_CaseLoader
var
    start: BOOL;
    stop: BOOL;
    run: BOOL;
    fault: BOOL;
    reset: BOOL;

//1
    st1: BOOL;      //levi drzac1 za casu
    st2: BOOL;      //desni drzac1 za casu
    st11: BOOL;     //povrat st1
    st22: BOOL;     //povrat st2
    sens01: BOOL;   //senzor1 za zapunjenje case magacina
    sens02: BOOL;   //senzor2 za zapunjenje case magacina

    st3: BOOL;      //levi drzac2 za casu
    st4: BOOL;      //desni drzac2 za casu
    st33: BOOL;     //povrat st3
    st44: BOOL;     //povrat st4


//2
    st5: BOOL;      //kretanje sisaljka1 za stavljenje
    st6: BOOL;      //kretanje sisaljka2 za stavljanje
    st55: BOOL;     //povratno kretanje za sisaljku1
    st66: BOOL;     //povratno kretanje za sisaljku2
    timer3: TON;    //timer povrata za sisaljke 1,2

//3
    st7: BOOL;      //cilindar1 od magacina na traku
    st8: BOOL;      //cilindar2 od magacina na traku
    st77: BOOL;     //povrat cilindar1
    st88: BOOL;     //povrat cilindar2
    timer4: TON;    //timer povrata za cilindari 1,2

//ostalo
    motor1: BOOL;   //motor za traku
   
    safety: BOOL;   //safety module za vrata
    sens03: BOOL;   //sensor1 iznad trake za polozaj case   
    sens04: BOOL;   //sensor2 iznad trake za polozaj case
    sens05: BOOL;   //sensor1 za pripremu za stavl. na traku
    sens06: BOOL;   //sensor2 za pripremu za stavl. na traku

    timer1: TON;    //timer nakon kretanja
    timer2: TON; 
    timer5: TON; 
    timer6: TON; 
    timer7: TON; 
    timer8: TON; 
end_var


//////////////////////////////
if reset then
    run:= FALSE;
ELSIF stop then
    run:= FALSE;
ELSIF start then
    run:= TRUE;
end_if

fault:= not safety;
//1
motor1:= run
        and not fault
        and sens01
        and sens02
        and not fb_tunel.sens03;

//DRZAC 1
//PNEVMO NAPRED
st1:= run and motor1 and not st11 and sens01;
    timer1(IN:=st1, PT:=T#1s);
    st11:= timer1.Q;

//PNEVMO NAZAD   
st2:= run and motor1 and not st22 and sens01;
    timer2(IN:=st2, PT:=T#1s);
    st22:= timer2.Q;

//DRZAC 2
//PNEVMO NAPRED
st3:= run and motor1 and not st33 and sens02;
    timer3(IN:=st3, PT:=T#1s);
    st33:=  timer3.Q;

//PNEVMO NAZAD
st4:= run and motor1 and not st44 and sens02;
    timer4(IN:=st4, PT:=T#1s);
    st44:=  timer4.Q;


//2
//SISALJKA 1 ZA STAVLJENJE PREMA TRAKE
//NAPRED
st5:= run and sens03
    and safety
    and motor1
    and not st55;
timer5(IN:=st5, PT:=T#1s);

//NAZAD
st55:= timer5.Q;

//SISALJKA 2 ZA STAVLJENJE PREMA TRAKE
//NAPRED
st6:= run and sens04
    and safety
    and motor1
    and not st66;
timer6(IN:=st6, PT:=T#1s);

//NAZAD
st66:= timer6.Q;

//3
//CILINDAR 1 NA TRAKU
//NAPRED
st7:= run and sens05
    and not st77;
    timer7(IN:=st7, PT:=T#1s);

//NAZAD
st77:= timer7.Q;

//CILINDAR 2 NA TRAKU
//NAPRED
st8:= run and sens06
    and not st88;
    timer8(IN:=st8, PT:=T#1s);

//NAZAD
st88:= timer8.Q;    

end_functional_block
