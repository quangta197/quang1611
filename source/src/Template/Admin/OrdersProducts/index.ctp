<div class="box">
    <div class="box-header">
        <h3 class="box-title">CHI TIẾT ĐƠN HÀNG</h3>
    </div> 
    <div class="box-body">
        <table class="table table-bitemOrdered table-responsive table-hover dataTable ">
            <thead>
                <tr>
                    <th scope="col"><?= $this->Paginator->sort('id') ?></th>
                    <th scope="col"><?= $this->Paginator->sort('orders_id') ?></th>
                    <th scope="col"><?= $this->Paginator->sort('products_id') ?></th>
                    
                    <th scope="col"><?= $this->Paginator->sort('Giá bán') ?></th>
                    <th scope="col"><?= $this->Paginator->sort('Số lượng') ?></th>
                    <th scope="col"><?= $this->Paginator->sort('Giá KM') ?></th>
                    <th scope="col" class="actions"><?= __('Actions') ?></th>
                </tr>
            </thead> 
            <tbody >
               <?php foreach ($ordersProducts as $itemOrder): ?>
                <tr>
                    <td><?= h($itemOrder->orders_products_id) ?></td>
                    <td style="text-align: center;"><?= $itemOrder->has('order') ? $this->Html->link($itemOrder->order->id, ['controller' => 'Orders', 'action' => 'view', $itemOrder->order->id]) : '' ?></td>
                    <td><?= $itemOrder->has('product') ? $this->Html->link($itemOrder->product->name, ['controller' => 'Products', 'action' => 'view', $itemOrder->product->id]) : '' ?></td>
                    
                    
                    <td><?= h($itemOrder->price) ?></td>
                    <td style="width: 100px;">
                        <input class="form-group col-md-12" type="number" min="0" id="quantity" 
                        value = "<?=$itemOrder->quantity?>">
                    </td>
                    <td><?= h($itemOrder->price_entered) ?></td>        
                    <td class="actions">
                        <?= $this->Html->link(__('Edit'), 
                        ['action' => 'edit' ,$itemOrder->order->id, $itemOrder->product->id]) ?>
                    </td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>

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
<!-- <script>
    $(document).ready(function(){
        $('#quantity').change(function(){  //  thẻ select class status change
            var status= $(this).val();
            var id= $(this).parent().parent().find('.id').text(); // lay thẻ cha . cha là <tr> find thẻ class id
            $.ajax({
                url:"/admin/orders-products/edit/"+id,
                type:"POST",
                data:{
                    idd:id,
                    statuss:status
                },
                dataType:"json",
            }).done(function (results) { 
                //console.log(data);
                alert("Đã thay đổi" + results);   
            });
        });
    });
</script> -->
