<?php

require_once(sfConfig::get('sf_lib_dir').'/filter/doctrine/BaseFormFilterDoctrine.class.php');

/**
 * Categorie filter form base class.
 *
 * @package    filters
 * @subpackage Categorie *
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 11675 2008-09-19 15:21:38Z fabien $
 */
class BaseCategorieFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'nom' => new sfWidgetFormFilterInput(),
    ));

    $this->setValidators(array(
      'nom' => new sfValidatorPass(array('required' => false)),
    ));

    $this->widgetSchema->setNameFormat('categorie_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    parent::setup();
  }

  public function getModelName()
  {
    return 'Categorie';
  }

  public function getFields()
  {
    return array(
      'id'  => 'Number',
      'nom' => 'Text',
    );
  }
}