
<?= $this->HTML->css('admin/config.css')?>
<div class="config-form"> 
    <div class="config-form-left">
        <?= $this->Form->create($configs); ?>
            <div class="form-row">
                <div class="form-group col-md-12">
                  <label >Key: </label>
                  <?= $this->Form->text('key', ['class' => 'form-control item', 'placeholder' => 'Nhập giá trị key ...']); ?>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                  <label >Description: </label>
                  <?= $this->Form->textarea('description', ['class' => 'form-control item','row'=>'5', 'placeholder' => 'Nhập mô tả ...']); ?>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                  <label style="width: 100%;">Type: </label>
                  <?= $this->Form->select('type', [
                        '1' => 'Boolen',
                        '2' => 'Text',
                        '3' => 'textarea',
                        '4' => 'Mã'
                    ]); ?>
                </div>
            </div>
             <div class="form-row">
                <div class="form-group col-md-12">
                  <label >Value: </label>
                  <?= $this->Form->textarea('value', ['class' => 'form-control item','row'=>'10', 'placeholder' => 'Nhập mô tả ...']); ?>
                </div>
            </div>
            <div class="form-row">
                <?= $this->Form->button(__('Thêm mới')) ?>
            </div>
        <?= $this->Form->end() ?>
    </div>
    <div class="config-form-right">
         <?php foreach ($configs as $config): ?>
            <?= $this->Form->create($config); ?>
            <div class="form-row">
                <div class="form-group col-md-1">
                    <div class="item edit"><i class="fas fa-pen"></i><?= $this->Html->link(__(''), ['action' => 'edit', $config->id]) ?></div>
                </div>
                <div class="form-group col-md-1">
                    <div class="item delete"><i class="fas fa-trash-alt"></i><?= $this->Form->postLink(__(''), ['action' => 'delete', $config->id], ['confirm' => __('Are you sure you want to delete # {0}?', $config->id)]) ?></div>
                </div>
                <div class="form-group col-md-5 description">
                    <?= h($config->description) ?>
                </div>
                <div class="form-group col-md-5 value">
                    <?= h($config->value) ?>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <?= $this->Form->textarea('description',['class' => 'form-control','rows'=>'1', 'placeholder' => 'Nhập mô tả ...']); ?>
                  <!-- <?= $this->Form->textarea('value', ['rows'=>'2']); ?> -->
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12 box-btn-item">
                    <?= $this->Form->button(__('Lưu'),['class'=>'btn-item save','action'=> '']) ?>
                    <?= $this->Form->button(__('Hủy'),['class'=>'btn-item cancel','action'=> '']) ?>
                </div>
            </div>
        <?php endforeach; ?>
        <?= $this->Form->end() ?>
    </div>
</div>
<div class="clear"></div>
<!-- <div class="box category admin1">
     <?php foreach ($configs as $config): ?>
    <tr>
        
        <td><?= $this->Number->format($config->id) ?></td>
        <td><?= h($config->name_key) ?></td>
        <td><?= $this->Number->format($config->type) ?></td>
        <td><?= h($config->value) ?></td>
        <td><?= h($config->special) ?></td>
        <td class="actions">
            <?= $this->Html->link(__('View'), ['action' => 'view', $config->id]) ?>
            <?= $this->Html->link(__('Edit'), ['action' => 'edit', $config->id]) ?>
            <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $config->id], ['confirm' => __('Are you sure you want to delete # {0}?', $config->id)]) ?>
        </td>
    </tr>
    <?php endforeach; ?>
</div>
 --><!-- <?= $this->Configs->getValue('234');?> -->
<!-- <?= $this->Configs->getValueByKey('234');?> -->
<div class="paginator">
        <ul class="pagination">
            <?= $this->Paginator->first('<< ' . __('first')) ?>
            <?= $this->Paginator->prev('< ' . __('previous')) ?>
            <?= $this->Paginator->numbers() ?>
            <?= $this->Paginator->next(__('next') . ' >') ?>
            <?= $this->Paginator->last(__('last') . ' >>') ?>
        </ul>
        <p><?= $this->Paginator->counter(['format' => __('Page {{page}} of {{pages}}, showing {{current}} record(s) out of {{count}} total')]) ?></p>
</div>

