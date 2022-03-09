CREATE OR REPLACE FUNCTION calculer_longueur_max(chaine1 varchar, chaine2 varchar) RETURNS integer AS
$$
    DECLARE
        maximum integer;
    BEGIN
        maximum := char_length(chaine1);
        if(char_length(chaine2)>maximum)
            then maximum := char_length(chaine2);
            end if;
        return maximum;
    END;


$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION nb_occurences(caractère varchar, chaine varchar, indice_debut integer, indice_fin integer) RETURNS integer AS
$$
    DECLARE
        resultat integer :=0;
    BEGIN
        FOR i in indice_debut..indice_fin LOOP
            if indice_debut<length(chaine) and indice_fin<length(chaine) and indice_debut<indice_fin THEN
                if caractère = substr(chaine,i,1) THEN
                    resultat := resultat+1 ;
                end if;
            end if;
        end loop ;
        return resultat ;
    END;
$$
LANGUAGE plpgsql;