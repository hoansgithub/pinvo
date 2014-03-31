<?php

class ControllerBase extends Phalcon\Mvc\Controller
{

    protected function initialize()
    {
        Phalcon\Tag::prependTitle('php breaker | ');
    }

    protected function forward($uri){
    	$uriParts = explode('/', $uri);
		$action=(isset($uriParts[1]))?$uriParts[1]:"index";
		$controller=(isset($uriParts[0]))?$uriParts[0]:"index";
    	return $this->dispatcher->forward(
    		array(
    			'controller' => $controller, 
    			'action' => $action
    		)
    	);
    }
}
