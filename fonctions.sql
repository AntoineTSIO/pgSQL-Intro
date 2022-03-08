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