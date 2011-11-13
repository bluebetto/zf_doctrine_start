<?php
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {
	protected function _initAutoload() {
		$autoloader = new Zend_Application_Module_Autoloader(array ('basePath' => APPLICATION_PATH, 'namespace' => '' ));
		return $autoloader;
	}
	
	protected function _initDoctrine() {
		$this->getApplication()->getAutoloader()->pushAutoloader(array ('Doctrine', 'autoload' ));
		spl_autoload_register(array ('Doctrine', 'modelsAutoload' ));
		$doctrineConfig = $this->getOption('doctrine');
		$manager = Doctrine_Manager::getInstance();
		$manager->setAttribute(Doctrine::ATTR_AUTO_ACCESSOR_OVERRIDE, true);
		$manager->setAttribute(Doctrine::ATTR_MODEL_LOADING, $doctrineConfig ['model_autoloading']);
		Doctrine::loadModels($doctrineConfig ['models_path']);
		$conn = Doctrine_Manager::connection($doctrineConfig ['dsn'], 'doctrine');
		$conn->setAttribute(Doctrine::ATTR_USE_NATIVE_ENUM, true);
		return $conn;
	}
	
	public function _initLocale() {
		$locale = new Zend_Locale('pt_BR');
		Zend_Registry::set('Zend_Locale', $locale);
	}
	
	public function _initSession() {
		Zend_Session::start();
	}
	
	public function _initJQuery() {
		$view = new Zend_View();
		$view->addHelperPath('ZendX/JQuery/View/Helper/', 'ZendX_JQuery_View_Helper');
		$view->addHelperPath(APPLICATION_PATH . "/views/helpers/", 'Zend_View_Helper');
		ZendX_JQuery::enableView($view);
		$viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
		$viewRenderer->setView($view);
	}
	
	public function _initRotas(){
		$front = Zend_Controller_Front::getInstance();
		$router = $front->getRouter();
	}
}

