<?php
/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class Additemimovel extends Doctrine_Migration_Base
{
    public function up()
    {
        $this->createTable('item_imovel', array(
             'id_item' => 
             array(
              'type' => 'integer',
              'length' => 8,
              'fixed' => false,
              'unsigned' => false,
              'primary' => true,
              'autoincrement' => false,
             ),
             'id_imovel' => 
             array(
              'type' => 'integer',
              'length' => 8,
              'fixed' => false,
              'unsigned' => false,
              'primary' => true,
              'autoincrement' => false,
             ),
             'valor' => 
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
              0 => 'id_item',
              1 => 'id_imovel',
             ),
             ));
    }

    public function down()
    {
        $this->dropTable('item_imovel');
    }
}