<?php
/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class CampoTemporada extends Doctrine_Migration_Base
{
    public function up()
    {
			$this->addColumn('imovel', 'valor_aluguel_diaria', 'decimal',12,array('fixed' => false,
																															              'unsigned' => false,
																															              'primary' => false,
																															              'notnull' => false,
																															              'autoincrement' => false,
																															              'scale' => '2'));
    }

    public function down()
    {
			$this->removeColumn('imovel', 'valor_aluguel_diaria');
    }
}