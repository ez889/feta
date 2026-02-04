

FUNCTION_BLOCK FB_punilica
    var
        sens01: BOOL;       //sens za kontrolu puta case pre punjaca, stoji pre sens02 oko 5cm
        sens02: BOOL;       //sensor stanja u punjaca case
        timer1: TON;        //ako casa stoji vise 5s=ide punjenje

        punj: BOOL;         //cilindar za punjenje
        zaust: BOOL;        //cilindar za saustavljenje case prema sensora
        safety: BOOL;       //safety module
        punj_enable: BOOL;  //zastava za punjenje

        timer2: TON;
        timer3: TON;

        pause_active: BOOL; //zastava za pauzu

        cycle_active: BOOL; //zastava za ciklus
    end_var

    zaust:= sens01;

    timer1(IN:=zaust, PT:=T#5s);

    punj_enable:= safety
                and sens02
                and zaust
                and timer1.Q;

    punj:= punj_enable
            and not timer2.Q;
    timer2(IN:=punj, PT:=T#500ms);  //cekamo punjenja

    pause_active:= (pause_active or timer2.Q) and not timer3.Q;
    
    timer3(IN:=pause_active, PT:=T#3s); //pauza nakon punjenja

    cycle_active:= punj_enable or punj or pause_active;


    FB_CaseLoader.motor1:= not cycle_active;



end_functional_block
