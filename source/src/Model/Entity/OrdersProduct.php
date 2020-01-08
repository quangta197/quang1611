<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * OrdersProduct Entity
 *
 * @property int $orders_id
 * @property int $products_id
 * @property int $price
 * @property int $quantity
 * @property string|null $products_name
 * @property int|null $price_sale
 * @property int|null $price_entered
 * @property int|null $price_comercial
 *
 * @property \App\Model\Entity\Order $order
 * @property \App\Model\Entity\Product $product
 */
class OrdersProduct extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    //protected $primaryKey = 'id';
    protected $_accessible = [
        'orders_id' => true,
        'products_id' => true,
        'price' => true,
        'quantity' => true,
        'products_name' => true,
        'url' => true,
        'price_entered' => true,
        'order' => true,
        'product' => true
    ];

    protected $_virtual = ['total_product'];
    
    protected function _getTotalProduct(){
        return $this->price * $this->quantity * (100 - $this->price_entered)/100 ;
    }
}
