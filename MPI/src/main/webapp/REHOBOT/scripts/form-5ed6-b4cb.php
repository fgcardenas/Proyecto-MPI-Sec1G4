<?php

require_once('FormProcessor.php');

$form = array(
    'subject' => 'Registro Rehobot',
    'email_message' => 'Su registro se ha realizado exitosamente',
    'success_redirect' => '',
    'sendIpAddress' => true,
    'email' => array(
    'from' => 'registrosrehobot@gmail.com',
    'to' => 'faritocardenas5@gmail.com',
    'toCopy' => 'faritocardenas5@gmail.com',
    'toHiddenCopy' => ''
    ),
    'fields' => array(
    'name' => array(
    'order' => 1,
    'type' => 'string',
    'label' => 'Nombre',
    'required' => true,
    'errors' => array(
    'required' => 'Field \'Nombre\' is required.'
    )
    ),
    'text-2' => array(
    'order' => 2,
    'type' => 'string',
    'label' => 'Rut',
    'required' => false,
    'errors' => array(
    'required' => 'Field \'Rut\' is required.'
    )
    ),
    'email' => array(
    'order' => 3,
    'type' => 'email',
    'label' => 'Email',
    'required' => true,
    'errors' => array(
    'required' => 'Field \'Email\' is required.'
    )
    ),
    'password1' => array(
    'order' => 4,
    'type' => 'string',
    'label' => 'Contraseña',
    'required' => true,
    'errors' => array(
    'required' => 'Field \'Contraseña\' is required.'
    )
    ),
    'password2' => array(
    'order' => 5,
    'type' => 'string',
    'label' => 'Confirme contraseña',
    'required' => true,
    'errors' => array(
    'required' => 'Field \'Confirme contraseña\' is required.'
    )
    ),
    )
    );

    $processor = new FormProcessor('');
    $processor->process($form);

    ?>