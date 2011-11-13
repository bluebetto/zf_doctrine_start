<?php
/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class Adddetalhe extends Doctrine_Migration_Base
{
    public function up()
    {
        $this->createTable('detalhe', array(
             'id_detalhe' => 
             array(
              'type' => 'integer',
              'length' => 4,
              'fixed' => false,
              'unsigned' => false,
              'primary' => true,
              'autoincrement' => false,
             ),
             'detalhe' => 
             array(
              'type' => 'string',
              'length' => 255,
              'fixed' => false,
              'unsigned' => false,
              'primary' => false,
              'notnull' => false,
              'autoincrement' => false,
             ),
             'padrao' => 
             array(
              'type' => 'string',
              'length' => 255,
              'fixed' => false,
              'unsigned' => false,
              'primary' => false,
              'notnull' => false,
              'autoincrement' => false,
             ),
             ), array(
             'indexes' => 
             array(
             ),
             'primary' => 
             array(
              0 => 'id_detalhe',
             ),
             ));
    }

    public function down()
    {
        $this->dropTable('detalhe');
    }
}