<?php
/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class Addnomedoimovel extends Doctrine_Migration_Base {
	public function up() {
		$this->addColumn('imovel', 'nome','string',255, array(
              'fixed' => false,
              'unsigned' => false,
              'primary' => false,
              'notnull' => false,
              'autoincrement' => false,
             ));
	
	}
	
	public function down() {
		$this->removeColumn('imovel', 'nome');
	}
}