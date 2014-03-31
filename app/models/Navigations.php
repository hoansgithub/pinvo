<?php

class Navigations extends Phalcon\Mvc\Model
{
    /**
     * @var integer
     */
    public $navigationID;

    /**
     * @var string
     */
    public $action;

    /**
     * @var string
     */
    public $controller;

    /**
     * @var string
     */
    public $text;

    /**
     * @var integer
     */
    public $order;
	/**
     * @var integer
     */
    public $active;
	/**
     * @var string
     */
    public $position;
	/**
     * @var integer
     */
    public $role;

}
