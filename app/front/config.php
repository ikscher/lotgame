<?php

//配置文件
return [
   'safe_q'=>[
      '1'=>'您父亲的姓名是什么',
      '2'=>'您母亲的姓名是什么',
      '3'=>'您的出生地',
      '4'=>'您的宠物的名字',
      '5'=>'您的职业是什么',
      '6'=>'您配偶的职业是什么'
   ],
   'geetest'=>[
      'captcha_id'=>'48a6ebac4ebc6642d68c217fca33eb4d',
      'private_key'=>'4f1c085290bec5afdc54df73535fc361'
   ],
   'scale_init'=>[  //各种游戏开奖初始赔率
      'xybjl'=>[
         'f1'=>array('2.2400','庄'), //BANKER
         'f2'=>array('2.1800','闲'), //PLAYER
         'f3'=>array('10.5000','和') //TIE
      ],
      'xy10'=>[
          'f1'=>array(9.9800,1),
          'f2'=>array(9.9800,2),
          'f3'=>array(9.9800,3),
          'f4'=>array(9.9800,4),
          'f5'=>array(9.9800,5),
          'f6'=>array(9.9800,6),
          'f7'=>array(9.9800,7),
          'f8'=>array(9.9800,8),
          'f9'=>array(9.9800,9),
          'f10'=>array(9.9800,10)
      ],
      'xy11'=>[
          'f2'=>array(36.0000,2),
          'f3'=>array(18.0000,3),
          'f4'=>array(12.0000,4),
          'f5'=>array(9.0000,5),
          'f6'=>array(7.2000,6),
          'f7'=>array(6.0000,7),
          'f8'=>array(7.2000,8),
          'f9'=>array(9.0000,9),
          'f10'=>array(12.0000,10),
          'f11'=>array(18.0000,11),
          'f12'=>array(36.0000,12)
      ]
   ]
];

// define("CAPTCHA_ID", "48a6ebac4ebc6642d68c217fca33eb4d");
// define("PRIVATE_KEY", "4f1c085290bec5afdc54df73535fc361");