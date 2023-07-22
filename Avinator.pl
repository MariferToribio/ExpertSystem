:-dynamic si/1,no/1,ave/1,verificar/1,caracteristicas/1.


caracteristicas([]).


evaluar:-
    ave(Ave),nl,
    writeln("R E S U L T A D O"),
    write("Ave: "),writeln(Ave),
    write("El ave es "), write(Ave), writeln(", porque respondiste si a las siguientes caracteristicas: "),nl,
    explicacion,
    writeln("-------------------------------"),
    write("¿El ave es la correcta?(si/no): "),
    read(Respuesta),

    (((Respuesta == no)->
      nueva_ave(Ave),eliminar_caracteristicas,deshacer,continuar_programa);

    ((Respuesta == si)->
      eliminar_caracteristicas,deshacer,continuar_programa)).


ave(zopilote_comun):-zopilote_comun.
ave(zopilote_aura):-zopilote_aura.
ave(paloma_comun):-paloma_comun.
ave(tortola_cola_larga):-tortola_cola_larga.
ave(loro_corona_lila):-loro_corona_lila.
ave(perico_frente_naranja):-perico_frente_naranja.
ave(garrapatero_pijuy):-garrapatero_pijuy.
ave(lechuza_de_campanario):-lechuza_de_campanario.
ave(chotacabras_menor):-chotacabras_menor.
ave(colibri_pico_ancho):-colibri_pico_ancho.
ave(momota_corona_cafe):-momota_corona_cafe.
ave(martin_pescador_verde):-martin_pescador_verde.
ave(carpintero_del_desierto):-carpintero_del_desierto.
ave(carpintero_cheje):-carpintero_cheje.
ave(mosquero_copeton):-mosquero_copeton.
ave(mosquero_cardenal):-mosquero_cardenal.
ave(chara_san_blas):-chara_san_blas.

/*
 *   Rangos de tamaños
 *   Pequeñas: 5-20cm
 *   Medianas: 21-40cm
 *   Grandes: 40+
*/


zopilote_comun:-
    verificar(pico_filoso_encorvado),
    verificar(cuerpo_negro),
    verificar(tamaño_grande_arriba_40cm).


zopilote_aura:-
    verificar(pico_filoso_encorvado),
    verificar(cabeza_roja),
    verificar(tamaño_grande_arriba_40cm).


paloma_comun:-
    verificar(pico_delgado),
    verificar(cuerpo_grisaceo),
    verificar(tamaño_medio_entre_21_40cm).


tortola_cola_larga:-
    verificar(pico_delgado),
    verificar(cuerpo_gris_cafe),
    verificar(tamaño_medio_entre_21_40cm).


loro_corona_lila:-
    verificar(pico_ancho_encorvado),
    verificar(cuerpo_verde),
    verificar(frente_roja),
    verificar(tamaño_medio_entre_21_40cm).


perico_frente_naranja:-
    verificar(pico_ancho_encorvado),
    verificar(cuerpo_verde),
    verificar(frente_anaranjada),
    verificar(tamaño_medio_entre_21_40cm).


garrapatero_pijuy:-
    verificar(pico_largo_punta_encorvada),
    verificar(cuerpo_negro),
    verificar(tamaño_medio_entre_21_40cm).


lechuza_de_campanario:-
    verificar(pico_ganchudo_filoso),
    verificar(cara_blanca),
    verificar(tamaño_grande_arriba_40cm).


chotacabras_menor:-
    verificar(pico_pequeño),
    verificar(cuerpo_gris_negro),
    verificar(tamaño_medio_entre_21_40cm).


colibri_pico_ancho:-
    verificar(pico_largo),
    verificar(cabeza_verde),
    verificar(pico_rojo),
    verificar(tamaño_pequeño_entre_5_20cm).


momota_corona_cafe:-
    verificar(pico_largo_puntiagudo),
    verificar(cuerpo_verde),
    verificar(cabeza_rojiza),
    verificar(tamaño_medio_entre_21_40cm).


martin_pescador_verde:-
    verificar(pico_largo_puntiagudo),
    verificar(cuerpo_verde),
    verificar(cabeza_verde),
    verificar(tamaño_pequeño_entre_5_20cm).


carpintero_del_desierto:-
    verificar(pico_conico_duro),
    verificar(cabeza_cafe_gris),
    verificar(vientre_amarillento),
    verificar(tamaño_medio_entre_21_40cm).


carpintero_cheje:-
    verificar(pico_conico_duro),
    verificar(cabeza_cafe_gris),
    verificar(frente_amarilla),
    verificar(tamaño_medio_entre_21_40cm).


mosquero_copeton:-
    verificar(pico_pequeño_ancho),
    verificar(cuerpo_cafe),
    verificar(tamaño_pequeño_entre_5_20cm).


mosquero_cardenal:-
    verificar(pico_pequeño_ancho),
    verificar(espalda_negra),
    verificar(vientre_rojo),
    verificar(tamaño_pequeño_entre_5_20cm).


chara_san_blas:-
    verificar(pico_pequeño_ancho),
    verificar(cola_azul),
    verificar(cuerpo_negro),
    verificar(tamaño_medio_entre_21_40cm).


preguntar(Pregunta):-
    write("¿Tiene el ave la siguiente característica: "),
    write(Pregunta),write("?(si/no): "),read(Respuesta),nl,
    ((Respuesta == si)->(assert(si(Pregunta)),agregar_caracteristica(Pregunta));
                         assert(no(Pregunta)),
                         fail).

agregar_caracteristica(Pregunta):-
    retract(caracteristicas(X)),
    append(X,[Pregunta],Nueva),
    assert(caracteristicas(Nueva)).


explicacion:-caracteristicas(X),
             mostrar_caracteristicas(X).


mostrar_caracteristicas([]):-writeln("").
mostrar_caracteristicas([Cabeza|Cola]):-
    write("-"),write(Cabeza),nl,
    mostrar_caracteristicas(Cola),
    true.


nueva_ave(Ave_erronea):-
    writeln("-----------------------------"),
    writeln("UTILIZA (_) PARA LOS ESPACIOS Y ESCRIBE EN MINUSCULAS"),
    write("Ingresa nombre de ave: "),
    read(Nueva_ave),nl,
    write("Ingrese una caracteristica del ave "),write(Nueva_ave),write(": "),
    read(Caracteristica),
    asserta((ave(Nueva_ave):-Ave_erronea,verificar(Caracteristica))).


continuar_programa:-
    write("¿Deseas continuar evaluando aves?(si/no): "),
    read(Respuesta),
    (((Respuesta == si)->evaluar);
     ((Respuesta == no)->write("-------------------"),tell('nuevas_aves.pl'),listing(ave),told)).


verificar(S):-
    (si(S)->  true;
    (no(S)->  fail;
    preguntar(S))).


eliminar_caracteristicas:-
    caracteristicas(X),
    eliminar(X).


eliminar([]).
eliminar([Cabeza|Cola]):-
    retract(caracteristicas([Cabeza|Cola])),
    assert(caracteristicas(Cola)),
    eliminar(Cola),
    true.


deshacer:- retract(si(_)),fail.
deshacer:- retract(no(_)),fail.
deshacer.










