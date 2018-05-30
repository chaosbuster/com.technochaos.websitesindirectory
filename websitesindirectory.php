<?php

require_once 'websitesindirectory.civix.php';

/**
 * Implementation of hook_civicrm_config
 */
function websitesindirectory_civicrm_config(&$config) {
  _websitesindirectory_civix_civicrm_config($config);
}

/**
 * Implementation of hook_civicrm_xmlMenu
 *
 * @param $files array(string)
 */
function websitesindirectory_civicrm_xmlMenu(&$files) {
  _websitesindirectory_civix_civicrm_xmlMenu($files);
}

/**
 * Implementation of hook_civicrm_install
 */
function websitesindirectory_civicrm_install() {
  return _websitesindirectory_civix_civicrm_install();
}

/**
 * Implementation of hook_civicrm_uninstall
 */
function websitesindirectory_civicrm_uninstall() {
  return _websitesindirectory_civix_civicrm_uninstall();
}

/**
 * Implementation of hook_civicrm_enable
 */
function websitesindirectory_civicrm_enable() {
  return _websitesindirectory_civix_civicrm_enable();
}

/**
 * Implementation of hook_civicrm_disable
 */
function websitesindirectory_civicrm_disable() {
  return _websitesindirectory_civix_civicrm_disable();
}

/**
 * Implementation of hook_civicrm_upgrade
 *
 * @param $op string, the type of operation being performed; 'check' or 'enqueue'
 * @param $queue CRM_Queue_Queue, (for 'enqueue') the modifiable list of pending up upgrade tasks
 *
 * @return mixed  based on op. for 'check', returns array(boolean) (TRUE if upgrades are pending)
 *                for 'enqueue', returns void
 */
function websitesindirectory_civicrm_upgrade($op, CRM_Queue_Queue $queue = NULL) {
  return _websitesindirectory_civix_civicrm_upgrade($op, $queue);
}

/**
 * Implementation of hook_civicrm_managed
 *
 * Generate a list of entities to create/deactivate/delete when this module
 * is installed, disabled, uninstalled.
 */
function websitesindirectory_civicrm_managed(&$entities) {
  return _websitesindirectory_civix_civicrm_managed($entities);
}

/**
 * Alter tpl file to include a different tpl file based on contribution/financial type
 * (if one exists). It will look for
 * templates/CRM/Contribute/Form/Contribution/Type2/Main.php
 * where the form has a contribution or financial type of 2
 *
 * @param string $formName name of the form
 * @param object $form (reference) form object
 * @param string $context page or form
 * @param string $tplName (reference) change this if required to the altered tpl file
 *
 * @return string
 */
function websitesindirectory_civicrm_alterTemplateFile($formName, &$form, $context, &$tplName) {

  if ($formName == 'CRM_Profile_Form_Search') {

    $possibleTpl = 'CRM/Profile/Page/View.tpl';
    $template = CRM_Core_Smarty::singleton();
    if ($template->template_exists($possibleTpl)) {
      $tplName = $possibleTpl;
	  return $tplName;
    } else {
		print("Couldn't find custom directory template");
	}
  }
  return;
}

/**
 * Function get additional specific phones
*/
function websites_civitoken_getWebsiteURL($contactID, $websiteType, $websiteURL ) {
  $params = array(
    'contact_id' => $contactID,
    'version' => 3,
    'sequential' => 1,
	'website_type_id' => $websiteType,
  );

  $websites = civicrm_api('Website', 'get', $params);
  if($websites['count']){
    return $websites['values'][0]['url'];
  }
}