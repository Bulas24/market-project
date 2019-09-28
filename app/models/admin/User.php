<?php


namespace app\models\admin;


class User extends \app\models\User
{
        public $attributes = [
            'id' => '',
            'login' => '',
            'password' => '',
            'name' => '',
            'number' => '',
            'email' => '',
            'address' => '',
            'role' => '',
        ];

        public $rules = [
            'required' => [
                ['login'],
                ['name'],
                ['number'],
                ['email'],
                ['role'],
            ],

            'email' => [
                ['email'],
            ],

            'numeric' => [
                ['number'],
            ],

            'integer' => [
                ['number', true],
            ],

            'lengthMin' => [
                ['number', 11],
            ],

            'lengthMax' => [
                ['number', 11],
            ],
        ];

        public function checkUnique()
        {
            $user = \R::findOne('user', '(login = ? OR email = ? OR number = ?) AND id <> ?',
                [$this->attributes['login'], $this->attributes['email'], $this->attributes['number'], $this->attributes['id']]);
            if ($user){
                if ($user->login == $this->attributes['login']){
                    $this->errors['unique'][] = 'Этот логин уже занят';
                }
                if ($user->email == $this->attributes['email']){
                    $this->errors['unique'][] = 'Этот email уже занят';
                }
                if ($user->number == $this->attributes['number']){
                    $this->errors['unique'][] = 'Этот телефон уже занят';
                }
                return false;
            }
            return true;
        }
}