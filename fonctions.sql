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

/*
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
*/
/*
CREATE OR REPLACE FUNCTION nb_occurences(caractère varchar, chaine varchar, indice_debut integer, indice_fin integer) RETURNS integer AS
$$
    DECLARE
        resultat integer :=0;
        i integer := indice_debut;
    BEGIN
        LOOP
            if indice_debut<length(chaine) and indice_fin<length(chaine) and indice_debut<indice_fin THEN
                if caractère = substr(chaine,i,1) THEN
                    resultat := resultat+1 ;
                    i := i+1;
                end if;
            end if;
            exit when i = indice_fin ;
        end loop ;
        return resultat ;
    END;
$$
LANGUAGE plpgsql;
*/

CREATE OR REPLACE FUNCTION nb_occurences(caractère varchar, chaine varchar, indice_debut integer, indice_fin integer) RETURNS integer AS
$$
    DECLARE
        resultat integer :=0;
        i integer := indice_debut;
    BEGIN
        WHILE i < indice_fin LOOP
            if indice_debut<length(chaine) and indice_fin<length(chaine) and indice_debut<indice_fin THEN
                if caractère = substr(chaine,i,1) THEN
                    resultat := resultat+1 ;
                    i := i+1;
                end if;
            end if;
        end loop ;
        return resultat ;
    END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION getNbJoursParMois(une_date date) RETURNS integer AS
$$
    DECLARE
        mois integer := EXTRACT(MONTH FROM une_date);
        annee integer := EXTRACT(YEAR FROM une_date);
        resultat integer;
    BEGIN
        IF mois=04 or mois=06 or mois=09 or mois=11 THEN
            resultat := 30;
        ELSIF mois=01 or mois=03 or mois=05 or mois=07 or mois=08 or mois=10 or mois=12 THEN
            resultat := 31;
        ELSIF mois = 02 and annee%4 = 0 THEN
            resultat := 29;
        ELSE
            resultat := 28;
        END IF;
        return resultat;
    END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION dateSqlToDatefr(une_date date) RETURNS varchar AS
$$
    DECLARE
        jour integer := EXTRACT(DAY FROM une_date);
        mois integer := EXTRACT(MONTH FROM une_date);
        annee integer := EXTRACT(YEAR FROM une_date);
        date_finale varchar;
    BEGIN
        date_finale := jour||'/'||mois||'/'||annee;
        return date_finale;
    END;
$$
LANGUAGE plpgsql;