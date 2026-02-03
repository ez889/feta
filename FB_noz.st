FUNCTIONAL_BLOCK FB_noz
    var
        sens01: BOOL;       //ulazni sens
        sens02: BOOL;       //izlazni sens
        
        pn2: BOOL;          //pnevmo za noz


        cut_enable: BOOL;
        timer1: TON;        //timer za ulaz
        timer2: TON;        //pauza

        safety: BOOL;       //safety module
        motor1: BOOL;       //motor za traku nakon izlaza
        
    end_var

    cut_enable:= safety
                and sens01
                and sens02;

    fb_tunel.motor2:= not cut_enable;         //zaustavljenje motor1 od tunela

    pn2:= cut_enable                          //noz dole
        and not timer1.Q;   
    timer1(IN:=pn2, PT:=T#300ms);             //cekamo kad noz stigne dole

    timer2(IN:= timer1.Q, PT:= T#3s);         //pauza nakon secenja



    motor1:= timer2.Q;      //traka dalje nakon noza kod pakerici

end_functional_block
