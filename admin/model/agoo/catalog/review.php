<?php
class agooModelCatalogReview extends Model {

   protected  $Review;
   protected  $data;
   public function __call($name, array $params)
   {
       $object = 'ModelCatalogReview';

       $loader_new = $this->registry->get('load');
       $loader_old = $this->registry->get('load_old');
       $this->registry->set('load', $loader_old);
       $this->load->model('catalog/review');
       $this->registry->set('load', $loader_new);

	   $this->Review =  new $object($this->registry);

       $data = call_user_func_array(array($this->Review , $name), $params);

       if (strtolower($name) =='editreview' || strtolower($name) =='addreview') {		  $ascp_settings = $this->config->get('ascp_settings');
		  if (isset($ascp_settings['review_visual']) && $ascp_settings['review_visual']) {
			 if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateFormReview()) {

				$this->registry->set('load', $loader_old);
				$this->load->model('catalog/review');

				if (!isset($this->request->get['review_id'])) {
					$review_id = $this->db->getLastId();
				} else {					$review_id = (int) $this->request->get['review_id'];
				}

				$this->model_catalog_review->editReview($review_id, $this->request->post);
				$this->registry->set('load', $loader_new);

				$this->request->post['name'] = strip_tags($this->db->escape($this->request->post['author']));
				$this->request->post['mark'] = 'product_id';
				$this->load->model('catalog/blogreview');
				$this->model_catalog_blogreview->editReview($review_id, $this->request->post);

				$product_id = $this->model_catalog_blogreview->getProductIdbyReviewId($review_id);

				$this->load->model('catalog/product');
				$product_info = $this->model_catalog_product->getProduct($product_id);



				$this->cont('record/treecomments');



				$mark = $this->data['mark'] = 'product_id';
				if (isset($this->request->post['thislist'])) {
					$str = base64_decode($this->request->post['thislist']);
					$this->data['thislist'] = unserialize($str);
				} else {
					$this->data['thislist'] = Array();
				}

	            if (isset($this->request->post['notify']) && $this->request->post['notify']) {

	                    $this->data['thislist']['signer'] = true;
	                    $this->data['thislist']['status_now'] 				      = $this->request->post['status'];
	                    $this->data['thislist']['comment_signer'] 				  = $this->request->post['status'];
						$this->data['thislist']['comment_status']                 = $this->request->post['status'];
						$this->data['thislist']['comment_status_reg']             = $this->request->post['status'];
						$this->data['thislist']['comment_status_now']             = $this->request->post['status'];
	                    $product_info['comment_id']								  = $review_id;
                         unset($this->data['thislist']['addfields']);
	             		$this->cont('record/signer');
				 		$this->controller_record_signer->signer($product_id, $product_info, $this->data['thislist'], $mark);
				}




			}
          }
       }
		        $this->cache->delete('product');
				$this->cache->delete('record');
				$this->cache->delete('blog');
				$this->cache->delete('blog.module.view');
				$this->cache->delete('product.blog.reviews');
				$this->cache->delete('blog.comment');

       return $data;
   }

/***************************************/
	public function validateFormReview()
	{
		if (!$this->user->hasPermission('modify', 'catalog/review')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (!$this->request->post['product_id']) {
			$this->error['product'] = $this->language->get('error_product');
		}
		if ((utf8_strlen($this->request->post['author']) < 3) || (utf8_strlen($this->request->post['author']) > 64)) {
			$this->error['author'] = $this->language->get('error_author');
		}
		if (utf8_strlen($this->request->post['text']) < 1) {
			$this->error['text'] = $this->language->get('error_text');
		}
		if (!isset($this->request->post['rating'])) {
			$this->error['rating'] = $this->language->get('error_rating');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
/***************************************/
	public function cont($cont)
	{
		$file = DIR_CATALOG . 'controller/' . $cont . '.php';
		$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $cont);
		if (file_exists($file)) {
			include_once($file);
			$this->registry->set('controller_' . str_replace('/', '_', $cont), new $class($this->registry));
		} else {
			trigger_error('Error: Could not load controller ' . $cont . '!');
			exit();
		}
	}
/***************************************/

}
?>