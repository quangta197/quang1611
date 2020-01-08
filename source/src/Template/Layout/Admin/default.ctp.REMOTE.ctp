<!DOCTYPE html>
<html lang="en">
<head>
    <?= $this->Html->charset() ?>                                         
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!-- bootstrap-slider-css-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.2/css/bootstrap-slider.min.css">
    <!-- bootstrap-slider-js-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.2/bootstrap-slider.min.js"></script>
    <?= $this->Html->css('admin/bootstrap.min.css'); ?>
    <?= $this->Html->css('admin/font-awesome.min.css'); ?>
    <?= $this->Html->css('admin/AdminLTE.min.css'); ?>   
    <?= $this->Html->css('admin/_all-skins.min.css'); ?>
    <!-- CSS -->
    <?= $this->Html->css('configs.css'); ?>
</head>
<body class="hold-transition skin-blue">
  <div class="wrapper">
  	<?= $this->element('Admin/header'); ?>
  	<?= $this->element('Admin/sidebar'); ?>
    <div class="content-wrapper">
      <section class="content-header"><h1>Dashboard<small>Control panel</small></h1></section>
      <section class="content">
        <?= $this->Flash->render() ?>
        <div id="main-content">
          <?= $this->fetch('content') ?>
        </div>
      </section>
    </div>  	
  	<?= $this->element('Admin/footer'); ?>
  </div>

  <?= $this->Html->script('jquery-3.3.1.min.js') ?>
  <?= $this->Html->script('admin/jquery-ui.min.js') ?>
  <?= $this->Html->script('admin/adminlte.min.js') ?>
</body>
</html>


