<?php

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
abstract class BaseAdministrateur extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('administrateur');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'length' => '4',
             ));
        $this->hasColumn('nom', 'string', 50, array(
             'type' => 'string',
             'notnull' => true,
             'length' => '50',
             ));
        $this->hasColumn('prenom', 'string', 20, array(
             'type' => 'string',
             'notnull' => true,
             'length' => '20',
             ));
        $this->hasColumn('mail', 'string', 100, array(
             'type' => 'string',
             'notnull' => true,
             'length' => '100',
             ));
        $this->hasColumn('mdp', 'string', 20, array(
             'type' => 'string',
             'notnull' => true,
             'length' => '20',
             ));
    }

    public function setUp()
    {
        parent::setUp();
    $this->hasMany('Annonce', array(
             'local' => 'id',
             'foreign' => 'validee_par'));

        $this->hasMany('Annonce as Annonce_7', array(
             'local' => 'id',
             'foreign' => 'validee_par'));
    }
}