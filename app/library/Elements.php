<?php
/**
 * Elements
 *
 * Helps to build UI elements for the application
 */
class Elements extends Phalcon\Mvc\User\Component
{

    private $_headerMenu = array(
        'pull-left' => array(
//            'index' => array(
//                'caption' => 'Home',
//                'action' => 'index'
//            ),
//            'invoices' => array(
//                'caption' => 'Invoices',
//                'action' => 'index'
//            ),
//            'about' => array(
//                'caption' => 'About',
//                'action' => 'index'
//            ),
//            'contact' => array(
//                'caption' => 'Contact',
//                'action' => 'index'
//            ),
        ),
        'pull-right' => array(
            'session' => array(
                'caption' => 'Log In/Sign Up',
                'action' => 'index'
            ),
        )
    );

    private $_tabs = array(
//        'Invoices' => array(
//            'controller' => 'invoices',
//            'action' => 'index'
//        ),
//        'Companies' => array(
//            'controller' => 'companies',
//            'action' => 'index'
//        ),
//        'Products' => array(
//            'controller' => 'products',
//            'action' => 'index'
//        ),
//        'Product Types' => array(
//            'controller' => 'producttypes'
//        ),
//        'Your Profile' => array(
//            'controller' => 'invoices',
//            'action' => 'profile'
//        )
    );

    /**
     * Builds header menu with left and right items
     *
     * @return string
     */
    public function getMenu()
    {
		$auth = $this->session->get('auth');
		$conditions="";
		if ($auth) {
			if($auth['role']!=1)
			{
				$conditions="active=1 and position='top-menu' and role=-1";
			}
			else{
				$conditions="active=1 and position='top-menu'";
			}
			 $this->_headerMenu['pull-right']['session'] = array(
                'caption' => 'Log Out',
                'action' => 'end'
            );
		}
		else{
			$conditions="active=1 and position='top-menu' and role=-1";
		}
		$mainmenudata=Navigations::find($conditions);
		foreach ($mainmenudata as $menu)
		{

				 $this->_headerMenu['pull-left'][$menu->controller]=array(
					'caption' => $menu->text,
	                'action' => $menu->action
				);
		}
       


        echo '<div class="nav-collapse">';
        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu as $position => $menu) {
            echo '<ul class="nav ', $position, '">';
            foreach ($menu as $controller => $option) {
                if ($controllerName == $controller) {
                    echo '<li class="active">';
                } else {
                    echo '<li>';
                }
                echo Phalcon\Tag::linkTo($controller.'/'.$option['action'], $option['caption']);
                echo '</li>';
            }
            echo '</ul>';
        }
        echo '</div>';
    }

    public function getTabs()
    {
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
		
		$adminmenudata=Navigations::find("active=1 and position='admin-menu'");
		foreach ($adminmenudata as $menu)
		{

				 $this->_tabs[$menu->text]=array(
					'controller' => $menu->controller,
	                'action' => $menu->action
				);
		}
		
        echo '<ul class="nav nav-tabs">';
        foreach ($this->_tabs as $caption => $option) {
            if ($option['controller'] == $controllerName && ($option['action'] == $actionName )) {
                echo '<li class="active">';
            } else {
                echo '<li>';
            }
            echo Phalcon\Tag::linkTo($option['controller'].'/'.$option['action'], $caption), '<li>';
        }
        echo '</ul>';
    }
}
