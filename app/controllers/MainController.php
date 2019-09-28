<?php


namespace app\controllers;




use ishop\Cache;

class MainController extends AppController
{
        public function indexAction()
        {
                $brands = \R::findAll('brand');
                $hits = \R::find('product', "hit = '1' AND status = '1'");
                $canonical = PATH;
                $this->setMeta('Главная страница', 'Описание', 'Ключевики');
                $this->set(compact('brands', 'hits', 'canonical'));

        }
}