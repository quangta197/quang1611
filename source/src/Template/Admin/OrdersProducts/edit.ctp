
<div class="orders form large-9 medium-8 columns content">
    <?= $this->Form->create($ordersProduct) ?>
    <legend><?= __('Edit Chi tiet Ðon') ?></legend>
    <div class = "row">
         <div class="form-group row">
            <label class="col-sm-3 col-form-label">Order</label> 
            <div class="col-sm-7">
                <?= $this->Form->select('orders_id', $orders, ['class' => 'form-control' ]);?>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">Product</label> 
            <div class="col-sm-7">
                <?= $this->Form->select('products_id', $ordersProduct->has('orders_id' == ), ['class' => 'form-control' ]);?>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">Giá</label> 
            <div class="col-sm-7">
                <?= $this->Form->text('price', ['class' => 'form-control' ]); ?>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">So luong</label> 
            <div class="col-sm-7">
                <?= $this->Form->text('quantity', ['class' => 'form-control' ]); ?>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">Tên sản phẩm</label> 
            <div class="col-sm-7">
                <?=  $this->Form->text('products_name', ['class' => 'form-control' ]); ?>
            </div>
        </div>


       
        <?= $this->Form->button(__('Submit')) ?>
        <?= $this->Form->end() ?>
    </div>
</div>