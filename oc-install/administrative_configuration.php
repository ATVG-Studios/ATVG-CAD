<?php

	session_start();

	require_once('include/shared.inc.php');    
    require_once('include/settings.inc.php');    
	require_once('include/functions.inc.php');
	require_once('include/languages.inc.php');	

	$task = isset($_POST['task']) ? prepare_input($_POST['task']) : '';
	$passed_step = isset($_SESSION['passed_step']) ? (int)$_SESSION['passed_step'] : 0;
	$focus_field = 'COMMUNITY_NAME';
	$error_msg = '';
	
	// handle previous steps
	// -------------------------------------------------
	if($passed_step >= 7){
		// OK
	}else{
		header('location: start.php');
		exit;				
	}
	
	// handle form submission
	// -------------------------------------------------
	if($task == 'send'){

		$MODERATOR_APPROVE_USER = isset($_POST['MODERATOR_APPROVE_USER']) ? prepare_input($_POST['MODERATOR_APPROVE_USER']) : '';
        $MODERATOR_EDIT_USER = isset($_POST['MODERATOR_EDIT_USER']) ? prepare_input($_POST['MODERATOR_EDIT_USER']) : '';
		$MODERATOR_DELETE_USER = isset($_POST['MODERATOR_DELETE_USER']) ? prepare_input($_POST['MODERATOR_DELETE_USER']) : '';
		
        $MODERATOR_SUSPEND_WITH_REASON = isset($_POST['MODERATOR_SUSPEND_WITH_REASON']) ? prepare_input($_POST['MODERATOR_SUSPEND_WITH_REASON']) : '';
		$MODERATOR_SUSPEND_WITHOUT_REASON = isset($_POST['MODERATOR_SUSPEND_WITHOUT_REASON']) ? prepare_input($_POST['MODERATOR_SUSPEND_WITHOUT_REASON']) : '';
		$MODERATOR_REACTIVATE_USER = isset($_POST['MODERATOR_REACTIVATE_USER']) ? prepare_input($_POST['MODERATOR_REACTIVATE_USER']) : '';

		$MODERATOR_REMOVE_GROUP = isset($_POST['MODERATOR_REMOVE_GROUP']) ? prepare_input($_POST['MODERATOR_REMOVE_GROUP']) : '';

		$MODERATOR_NCIC_EDITOR = isset($_POST['MODERATOR_NCIC_EDITOR']) ? prepare_input($_POST['MODERATOR_NCIC_EDITOR']) : '';
		
		$_SESSION['MODERATOR_APPROVE_USER'] = $MODERATOR_APPROVE_USER;
		$_SESSION['MODERATOR_EDIT_USER'] = $MODERATOR_EDIT_USER;			
		$_SESSION['MODERATOR_DELETE_USER'] = $MODERATOR_DELETE_USER;

		$_SESSION['MODERATOR_SUSPEND_WITH_REASON'] = $MODERATOR_SUSPEND_WITH_REASON;
		$_SESSION['MODERATOR_SUSPEND_WITHOUT_REASON'] = $MODERATOR_SUSPEND_WITHOUT_REASON;
		$_SESSION['MODERATOR_REACTIVATE_USER'] = $MODERATOR_REACTIVATE_USER;

		$_SESSION['MODERATOR_REMOVE_GROUP'] = $MODERATOR_REMOVE_GROUP;

		$_SESSION['MODERATOR_NCIC_EDITOR'] = $MODERATOR_NCIC_EDITOR;

		$_SESSION['passed_step'] = 8;
		header('location: extra_settings.php');
		exit;

	}else{

		$MODERATOR_APPROVE_USER = isset($_POST['MODERATOR_APPROVE_USER']) ? prepare_input($_POST['MODERATOR_APPROVE_USER']) : '';
        $MODERATOR_EDIT_USER = isset($_POST['MODERATOR_EDIT_USER']) ? prepare_input($_POST['MODERATOR_EDIT_USER']) : '';
		$MODERATOR_DELETE_USER = isset($_POST['MODERATOR_DELETE_USER']) ? prepare_input($_POST['MODERATOR_DELETE_USER']) : '';
		
        $MODERATOR_SUSPEND_WITH_REASON = isset($_POST['MODERATOR_SUSPEND_WITH_REASON']) ? prepare_input($_POST['MODERATOR_SUSPEND_WITH_REASON']) : '';
		$MODERATOR_SUSPEND_WITHOUT_REASON = isset($_POST['MODERATOR_SUSPEND_WITHOUT_REASON']) ? prepare_input($_POST['MODERATOR_SUSPEND_WITHOUT_REASON']) : '';
		$MODERATOR_REACTIAVATE_USER = isset($_POST['MODERATOR_REACTIAVATE_USER']) ? prepare_input($_POST['MODERATOR_REACTIAVATE_USER']) : '';

		$MODERATOR_REMOVE_GROUP = isset($_POST['MODERATOR_REMOVE_GROUP']) ? prepare_input($_POST['MODERATOR_REMOVE_GROUP']) : '';

		$MODERATOR_NCIC_EDITOR = isset($_POST['MODERATOR_NCIC_EDITOR']) ? prepare_input($_POST['MODERATOR_NCIC_EDITOR']) : '';

	}
?>	

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="ApPHP Company - Advanced Power of PHP">
    <meta name="generator" content="ApPHP EasyInstaller">
	<title><?php echo lang_key("installation_guide"); ?> | System Settings</title>

	<link href="../images/favicon.ico" rel="shortcut icon" />
	<link rel="stylesheet" type="text/css" href="templates/<?php echo EI_TEMPLATE; ?>/css/styles.css" />
	<?php
		if($curr_lang_direction == 'rtl'){
			echo '<link rel="stylesheet" type="text/css" href="templates/'.EI_TEMPLATE.'/css/rtl.css" />'."\n";
		}
	?>

	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<?php
		if(file_exists('languages/js/'.$curr_lang.'.js')){
			echo '<script type="text/javascript" src="language/'.$curr_lang.'/js/common.js"></script>';
		}else{
			echo '<script type="text/javascript" src="language/en/js/common.js"></script>';
		}
	?>
</head>
<body onload="bodyOnLoad()">
<div id="main">
	<h1><?php echo lang_key('new_installation_of'); ?> <?php echo EI_APPLICATION_NAME.' '.EI_APPLICATION_VERSION;?>!</h1>
	<h2 class="sub-title"><?php echo lang_key('sub_title_message'); ?></h2>
	
	<div id="content">
		<?php
			draw_side_navigation(8);		
		?>
		<div class="central-part">
			<h2><?php echo lang_key('step_8_of'); ?> - Administrative Settings</h2>
			<h3><?php echo lang_key('administrative_configuration'); ?></h3>

			<form action="administrative_configuration.php" method="post">
			<input type="hidden" name="task" value="send" />
			<input type="hidden" name="token" value="<?php echo $_SESSION['token']; ?>" />
			
			<?php
				if(!empty($error_msg)){
					echo '<div class="alert alert-error">'.$error_msg.'</div>';
				}
			?>

			<table width="100%" border="0" cellspacing="1" cellpadding="1">
			<tr>
				<td colspan="3"><span class="star">*</span> <?php echo lang_key('alert_required_fields'); ?></td>
			</tr>
			<tr><td nowrap height="10px" colspan="3"></td></tr>
			<tr>
				<td width="250px">&nbsp;<?php echo lang_key('MODERATOR_APPROVE_USER'); ?>&nbsp;</td>
				<td>
					<input type="radio" name="MODERATOR_APPROVE_USER" id="MODERATOR_APPROVE_USER" <?php echo ($MODERATOR_APPROVE_USER=='true')?'checked':'' ?> checked onfocus="textboxOnFocus('MODERATOR_APPROVE_USER_notes')" checked onblur="textboxOnBlur('MODERATOR_APPROVE_USER_notes')" value="true" />True
					<input type="radio" name="MODERATOR_APPROVE_USER" id="MODERATOR_APPROVE_USER" <?php echo ($MODERATOR_APPROVE_USER=='false')?'checked':'' ?> onfocus="textboxOnFocus('MODERATOR_APPROVE_USER_notes')" onblur="textboxOnBlur('MODERATOR_APPROVE_USER_notes')" value="false" />False
				</td>
				<td rowspan="6" valign="top">					
					<div id="POLICE_NCIC_notes" class="notes_container">
						<h4><?php echo lang_key('POLICE_NCIC'); ?></h4>
						<p><?php echo lang_key('POLICE_NCIC_notes'); ?></p>
					</div>
					<div id="COMMUNITY_NAME_notes" class="notes_container">
						<h4><?php echo lang_key('COMMUNITY_NAME'); ?></h4>
						<p><?php echo lang_key('COMMUNITY_NAME_notes'); ?></p>
					</div>
					<div id="BASE_URL_notes" class="notes_container">
						<h4><?php echo lang_key('BASE_URL'); ?></h4>
						<p><?php echo lang_key('BASE_URL_notes'); ?></p>
					</div>
					<div id="API_SECURITY_notes" class="notes_container">
						<h4><?php echo lang_key('API_SECURITY_URL'); ?></h4>
						<p><?php echo lang_key('API_SECURITY_notes'); ?></p>
					</div>
					
					<div id="FIRE_PANIC_notes" class="notes_container">
						<h4><?php echo lang_key('FIRE_PANIC'); ?></h4>
						<p><?php echo lang_key('FIRE_PANIC_notes'); ?></p>
					</div>
					
					<img class="loading_img" src="images/ajax_loading.gif" alt="<?php echo lang_key('loading'); ?>..." />
					<div id="notes_message" class="notes_container"></div>					
				</td>
			</tr>
			<tr>
				<td>&nbsp;<?php echo lang_key('MODERATOR_EDIT_USER'); ?>&nbsp;</td>
				<td><input type="radio" name="MODERATOR_EDIT_USER" id="MODERATOR_EDIT_USER" <?php echo ($MODERATOR_APPROVE_USER=='true')?'checked':'' ?> checked onfocus="textboxOnFocus('MODERATOR_EDIT_USER_notes')" onblur="textboxOnBlur('MODERATOR_EDIT_USER')" value="true" />True
				<input type="radio" name="MODERATOR_EDIT_USER" id="MODERATOR_EDIT_USER" <?php echo ($MODERATOR_APPROVE_USER=='false')?'checked':'' ?> onfocus="textboxOnFocus('MODERATOR_EDIT_USER_notes')" onblur="textboxOnBlur('MODERATOR_EDIT_USER)" value="false" />False</td>
			</tr>
			<tr>
				<td>&nbsp;<?php echo lang_key('MODERATOR_DELETE_USER'); ?>&nbsp;</td>
				<td><input type="radio" name="MODERATOR_DELETE_USER" id="MODERATOR_DELETE_USER" <?php echo ($MODERATOR_DELETE_USER=='true')?'checked':'' ?> checked onfocus="textboxOnFocus('MODERATOR_DELETE_USER_notes')" checked onblur="textboxOnBlur('MODERATOR_DELETE_USER_notes')" value="true" />True
				<input type="radio" name="MODERATOR_DELETE_USER" id="MODERATOR_DELETE_USER" <?php echo ($MODERATOR_DELETE_USER=='false')?'checked':'' ?> onfocus="textboxOnFocus('MODERATOR_DELETE_USER_notes')" onblur="textboxOnBlur('MODERATOR_DELETE_USER_notes')" value="false" />False</td>
			</tr>
			<tr><td colspan="2" nowrap height="5px">&nbsp;</td></tr>
			<tr>
				<td>&nbsp;<?php echo lang_key('MODERATOR_SUSPEND_WITH_REASON'); ?>&nbsp;</td>
				<td><input type="radio" name="MODERATOR_SUSPEND_WITH_REASON" id="MODERATOR_SUSPEND_WITH_REASON" <?php echo ($MODERATOR_SUSPEND_WITH_REASON=='true')?'checked':'' ?> checked onfocus="textboxOnFocus('MODERATOR_SUSPEND_WITH_REASON_notes')" onblur="textboxOnBlur('MODERATOR_SUSPEND_WITH_REASON_notes')" value="true" />True
				<input type="radio" name="MODERATOR_SUSPEND_WITH_REASON" id="MODERATOR_SUSPEND_WITH_REASON" <?php echo ($MODERATOR_SUSPEND_WITH_REASON=='false')?'checked':'' ?> onfocus="textboxOnFocus('MODERATOR_SUSPEND_WITH_REASON_notes')" onblur="textboxOnBlur('MODERATOR_SUSPEND_WITH_REASON_notes')" value="false" />False</td>
			</tr>
			<tr>
				<td>&nbsp;<?php echo lang_key('MODERATOR_SUSPEND_WITHOUT_REASON'); ?>&nbsp;</td>
				<td><input type="radio" name="MODERATOR_SUSPEND_WITHOUT_REASON" id="MODERATOR_SUSPEND_WITHOUT_REASON" <?php echo ($MODERATOR_SUSPEND_WITHOUT_REASON=='true')?'checked':'' ?> checked onfocus="textboxOnFocus('MODERATOR_SUSPEND_WITHOUT_REASON_notes')" onblur="textboxOnBlur('MODERATOR_SUSPEND_WITHOUT_REASON_notes')" value="true" />True
				<input type="radio" name="MODERATOR_SUSPEND_WITHOUT_REASON" id="MODERATOR_SUSPEND_WITHOUT_REASON" <?php echo ($MODERATOR_SUSPEND_WITHOUT_REASON=='false')?'checked':'' ?> onfocus="textboxOnFocus('MODERATOR_SUSPEND_WITHOUT_REASON_notes')" onblur="textboxOnBlur('MODERATOR_SUSPEND_WITHOUT_REASON_notes')" value="false" />False</td>
			</tr>
			<tr>
				<td>&nbsp;<?php echo lang_key('MODERATOR_REACTIVATE_USER'); ?>&nbsp;</td>
				<td><input type="radio" name="MODERATOR_REACTIVATE_USER" id="MODERATOR_REACTIVATE_USER" <?php echo ($MODERATOR_SUSPEND_WITHOUT_REASON=='true')?'checked':'' ?> checked onfocus="textboxOnFocus('MODERATOR_REACTIVATE_USER_WITHOUT_REASON_notes')" onblur="textboxOnBlur('MODERATOR_REACTIVATE_USER_notes')" value="true" />True
				<input type="radio" name="MODERATOR_REACTIVATE_USER" id="MODERATOR_REACTIVATE_USER" <?php echo ($MODERATOR_SUSPEND_WITHOUT_REASON=='false')?'checked':'' ?> onfocus="textboxOnFocus('MODERATOR_REACTIVATE_USER_notes')" onblur="textboxOnBlur('MODERATOR_REACTIVATE_USER_notes')" value="false" />False</td>
			</tr>
			<tr><td colspan="2" nowrap height="5px">&nbsp;</td></tr>
			<tr>
			<td>&nbsp;<?php echo lang_key('MODERATOR_REMOVE_GROUP'); ?>&nbsp;</td>
				<td><input type="radio" name="MODERATOR_REMOVE_GROUP" id="MODERATOR_REMOVE_GROUP" <?php echo ($MODERATOR_NCIC_EDITOR=='true')?'checked':'' ?> checked onfocus="textboxOnFocus('MODERATOR_REMOVE_GROUP_notes')" checked onblur="textboxOnBlur('MODERATOR_REMOVE_GROUP_notes')" value="true" />True
				<input type="radio" name="MODERATOR_REMOVE_GROUP" id="MODERATOR_REMOVE_GROUP" <?php echo ($MODERATOR_NCIC_EDITOR=='false')?'checked':'' ?> onfocus="textboxOnFocus('MODERATOR_REMOVE_GROUP_notes')" onblur="textboxOnBlur('MODERATOR_REMOVE_GROUP_notes')" value="false" />False</td>
			</tr>
			<tr><td colspan="2" nowrap height="5px">&nbsp;</td></tr>
			<tr>
				<td>&nbsp;<?php echo lang_key('MODERATOR_NCIC_EDITOR'); ?>&nbsp;</td>
				<td><input type="radio" name="MODERATOR_NCIC_EDITOR" id="MODERATOR_NCIC_EDITOR" <?php echo ($MODERATOR_NCIC_EDITOR=='true')?'checked':'' ?> checked onfocus="textboxOnFocus('MODERATOR_NCIC_EDITOR_notes')" onblur="textboxOnBlur('MODERATOR_NCIC_EDITOR_notes')" value="true" />True
				<input type="radio" name="MODERATOR_NCIC_EDITOR" id="MODERATOR_NCIC_EDITOR" <?php echo ($MODERATOR_NCIC_EDITOR=='false')?'checked':'' ?> onfocus="textboxOnFocus('MODERATOR_NCIC_EDITOR_notes')" onblur="textboxOnBlur('MODERATOR_NCIC_EDITOR_notes')" value="false" />False</td>
			</tr>
			<tr><td colspan="2" nowrap height="5px">&nbsp;</td></tr>
			<tr>
				<td colspan="2">
					<a href="civilian_configuration.php" class="form_button" /><?php echo lang_key('back'); ?></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" class="form_button" value="<?php echo lang_key('continue'); ?>" />
				</td>
			</tr>                        
			</table>
			</form>                        
		</div>
		<div class="clear"></div>
	</div>
	
	<?php include_once('include/footer.inc.php'); ?>        

</div>

<script type="text/javascript">
	function bodyOnLoad(){
		setFocus("<?php echo $focus_field; ?>");
	}	
</script>
</body>
</html>
