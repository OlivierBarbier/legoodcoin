CREATE TABLE administrateur (id INT AUTO_INCREMENT, nom VARCHAR(50) NOT NULL, prenom VARCHAR(20) NOT NULL, mail VARCHAR(100) NOT NULL, mdp VARCHAR(20) NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE annonce (id INT AUTO_INCREMENT, etat_de_validation VARCHAR(8) DEFAULT 'wait', nom_annonceur VARCHAR(20), ville VARCHAR(30) NOT NULL, code_postal VARCHAR(5) NOT NULL, contenu TEXT NOT NULL, titre VARCHAR(50) NOT NULL, prix DECIMAL(65,2), est_abusif INT DEFAULT '0', type_annonce VARCHAR(255) NOT NULL, categorie INT NOT NULL, region INT NOT NULL, departement INT NOT NULL, telephone VARCHAR(10), annonceur INT, validee_par INT, date_control DATETIME, pays CHAR(2), slug VARCHAR(255), UNIQUE INDEX sluggable_idx (slug), INDEX validee_par_idx (validee_par), INDEX region_idx (region), INDEX departement_idx (departement), INDEX categorie_idx (categorie), INDEX annonceur_idx (annonceur), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE annonce_photo (id BIGINT AUTO_INCREMENT, annonce_id INT, filename VARCHAR(255), INDEX annonce_id_idx (annonce_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE annonceur (id INT AUTO_INCREMENT, sf_guard_user_id INT NOT NULL, type_annonceur VARCHAR(12), INDEX sf_guard_user_id_idx (sf_guard_user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE categorie (id INT AUTO_INCREMENT, nom VARCHAR(200) NOT NULL, pays CHAR(2), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE code_postaux (id INT AUTO_INCREMENT, commune VARCHAR(50) NOT NULL, codepos CHAR(5) NOT NULL, departement VARCHAR(50) NOT NULL, insee VARCHAR(10) NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE departement (code_dep INT, nom VARCHAR(255) NOT NULL, region INT DEFAULT '0' NOT NULL, pays CHAR(2), slug VARCHAR(255), UNIQUE INDEX sluggable_idx (slug), INDEX region_idx (region), PRIMARY KEY(code_dep)) ENGINE = INNODB;
CREATE TABLE region (id INT AUTO_INCREMENT, nom VARCHAR(100) NOT NULL, pays CHAR(2), slug VARCHAR(255), UNIQUE INDEX sluggable_idx (slug), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group (id INT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME, updated_at DATETIME, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group_permission (group_id INT, permission_id INT, created_at DATETIME, updated_at DATETIME, PRIMARY KEY(group_id, permission_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_permission (id INT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME, updated_at DATETIME, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_remember_key (id INT AUTO_INCREMENT, user_id INT, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME, updated_at DATETIME, INDEX user_id_idx (user_id), PRIMARY KEY(id, ip_address)) ENGINE = INNODB;
CREATE TABLE sf_guard_user (id INT AUTO_INCREMENT, username VARCHAR(128) NOT NULL UNIQUE, algorithm VARCHAR(128) DEFAULT 'sha1' NOT NULL, salt VARCHAR(128), password VARCHAR(128), is_active TINYINT(1) DEFAULT '1', is_super_admin TINYINT(1) DEFAULT '0', last_login DATETIME, created_at DATETIME, updated_at DATETIME, INDEX is_active_idx_idx (is_active), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_group (user_id INT, group_id INT, created_at DATETIME, updated_at DATETIME, PRIMARY KEY(user_id, group_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_permission (user_id INT, permission_id INT, created_at DATETIME, updated_at DATETIME, PRIMARY KEY(user_id, permission_id)) ENGINE = INNODB;
ALTER TABLE annonce ADD FOREIGN KEY (validee_par) REFERENCES administrateur(id);
ALTER TABLE annonce ADD FOREIGN KEY (region) REFERENCES region(id);
ALTER TABLE annonce ADD FOREIGN KEY (departement) REFERENCES departement(code_dep);
ALTER TABLE annonce ADD FOREIGN KEY (categorie) REFERENCES categorie(id);
ALTER TABLE annonce ADD FOREIGN KEY (annonceur) REFERENCES annonceur(id);
ALTER TABLE annonce_photo ADD FOREIGN KEY (annonce_id) REFERENCES annonce(id);
ALTER TABLE annonceur ADD FOREIGN KEY (sf_guard_user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE departement ADD FOREIGN KEY (region) REFERENCES region(id);
ALTER TABLE sf_guard_group_permission ADD FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_remember_key ADD FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
