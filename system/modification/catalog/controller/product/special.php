<?php
class ControllerProductSpecial extends Controller {

				private function _removeMfpFromUrl( $url ) {
					if( false !== ( $mfpPos = mb_strpos( $url, '?mfp=', 0, 'utf8' ) ) ) {
						$before = $mfpPos ? mb_substr( $url, 0, $mfpPos, 'utf8' ) : '';
						$after	= '';
				
						if( false !== ( $pos = mb_strpos( $url, '&', $mfpPos+1, 'utf8' ) ) ) {
							$after = '?' . mb_substr( $url, $pos+1, NULL, 'utf8' );
						}
				
						$url = $before . $after;
					} else if( false !== ( $mfpPos = mb_strpos( $url, '&mfp=', 0, 'utf8' ) ) ) {
						$before = $mfpPos ? mb_substr( $url, 0, $mfpPos, 'utf8' ) : '';
						$after	= '';
				
						if( false !== ( $pos = mb_strpos( $url, '&', $mfpPos+1, 'utf8' ) ) ) {
							$after = '?' . mb_substr( $url, $pos+1, NULL, 'utf8' );
						}
				
						$url = $before . $after;
					} else if( false !== ( $mfpPos = mb_strpos( $url, 'mfp,', 0, 'utf8' ) ) ) {
						$before = $mfpPos ? mb_substr( $url, 0, $mfpPos, 'utf8' ) : '';
						$after	= '';
				
						if( false !== ( $pos = mb_strpos( $url, '?', $mfpPos+1, 'utf8' ) ) ) {
							$after = mb_substr( $url, $pos, NULL, 'utf8' );
						} else if( false !== ( $pos = mb_strpos( $url, '&', $mfpPos+1, 'utf8' ) ) ) {
							$after = '?' . mb_substr( $url, $pos+1, NULL, 'utf8' );
						} else if( false !== ( $pos = mb_strpos( $url, '/', $mfpPos+1, 'utf8' ) ) ) {
							$after = mb_substr( $url, $mfpPos, $pos, 'utf8' );
						}
				
						$url = $before . $after;
					}
				
					return $url;
				}
			
	public function index() {
		$this->load->language('product/special');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_product_limit');
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . urlencode( $this->request->get['mfp'] );
				}
			

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('product/special', $url)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_quantity'] = $this->language->get('text_quantity');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_model'] = $this->language->get('text_model');
		$data['text_price'] = $this->language->get('text_price');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_points'] = $this->language->get('text_points');
		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');

		$data['button_cart'] = $this->language->get('button_cart');
 
				$data['text_option'] = $this->language->get('text_option');
				$data['text_select'] = $this->language->get('text_select');
				
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_list'] = $this->language->get('button_list');
		$data['button_grid'] = $this->language->get('button_grid');
		$data['button_continue'] = $this->language->get('button_continue');
		
		$data['compare'] = $this->url->link('product/compare');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $limit,
			'limit' => $limit
		);

		
				if( isset( $this->request->get['category_id'] ) ) {
					$filter_data['filter_category_id'] = (int) $this->request->get['category_id'];
				}
			

		$results = $this->model_catalog_product->getProductSpecials($filter_data);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}

			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
			} else {
				$tax = false;
			}

			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}


					   $options = array();
                    foreach ($this->model_catalog_product->getProductOptions($result['product_id']) as $option) {
                        $product_option_value_data = array();
                        foreach ($option['product_option_value'] as $option_value) {
                            if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                                if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
                                    $price = $this->currency->format($this->tax->calculate($option_value['price'], $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false));
                                } else {
                                    $price = false;
                                }
                                $product_option_value_data[] = array(
                                    'product_option_value_id' => $option_value['product_option_value_id'],
                                    'option_value_id'         => $option_value['option_value_id'],
                                    'name'                    => $option_value['name'],
                                    'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
                                    'price'                   => $price,
                                    'price_prefix'            => $option_value['price_prefix']
                                );
                            }
                        }
                        $options[] = array(
                            'product_option_id'    => $option['product_option_id'],
                            'product_option_value' => $product_option_value_data,
                            'option_id'            => $option['option_id'],
                            'name'                 => $option['name'],
                            'type'                 => $option['type'],
                            'value'                => $option['value'],
                            'required'             => $option['required']
                        );
                    }
				
			$data['products'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
 
				'img-width'       => $this->config->get('config_image_product_width'),
				'img-height'       => $this->config->get('config_image_product_height'),
				
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
				'price'       => $price,
				'special'     => $special,
				'tax'         => $tax,
				'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
				'rating'      => $result['rating'],
				'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
,
					  'options'     => $options
				
			);
		}

		$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . urlencode( $this->request->get['mfp'] );
				}
			

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['sorts'] = array();

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_default'),
			'value' => 'p.sort_order-ASC',
			'href'  => $this->url->link('product/special', 'sort=p.sort_order&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_asc'),
			'value' => 'pd.name-ASC',
			'href'  => $this->url->link('product/special', 'sort=pd.name&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_desc'),
			'value' => 'pd.name-DESC',
			'href'  => $this->url->link('product/special', 'sort=pd.name&order=DESC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_price_asc'),
			'value' => 'ps.price-ASC',
			'href'  => $this->url->link('product/special', 'sort=ps.price&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_price_desc'),
			'value' => 'ps.price-DESC',
			'href'  => $this->url->link('product/special', 'sort=ps.price&order=DESC' . $url)
		);

		if ($this->config->get('config_review_status')) {
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_desc'),
				'value' => 'rating-DESC',
				'href'  => $this->url->link('product/special', 'sort=rating&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_asc'),
				'value' => 'rating-ASC',
				'href'  => $this->url->link('product/special', 'sort=rating&order=ASC' . $url)
			);
		}

		$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/special', 'sort=p.model&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_model_desc'),
			'value' => 'p.model-DESC',
			'href'  => $this->url->link('product/special', 'sort=p.model&order=DESC' . $url)
		);

		$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . urlencode( $this->request->get['mfp'] );
				}
			

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$data['limits'] = array();

		$limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));

		sort($limits);

		foreach($limits as $value) {
			$data['limits'][] = array(
				'text'  => $value,
				'value' => $value,
				'href'  => $this->url->link('product/special', $url . '&limit=' . $value)
			);
		}

		$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . urlencode( $this->request->get['mfp'] );
				}
			

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('product/special', $url . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/special.tpl')) {

				if( isset( $this->request->get['mfilterAjax'] ) ) {
					$this->load->model( 'module/mega_filter' );
				
					if( class_exists( 'MegaFilterCore' ) ) {
						$settings	= $this->config->get('mega_filter_settings');
						$baseTypes	= array( 'stock_status', 'manufacturers', 'rating', 'attributes', 'price', 'options', 'filters' );

						if( isset( $this->request->get['mfilterBTypes'] ) ) {
							$baseTypes = explode( ',', $this->request->get['mfilterBTypes'] );
						}

						if( ! empty( $settings['calculate_number_of_products'] ) || in_array( 'categories:tree', $baseTypes ) ) {
							if( empty( $settings['calculate_number_of_products'] ) ) {
								$baseTypes = array( 'categories:tree' );
							}

							$this->load->model( 'module/mega_filter' );

							$idx = 0;

							if( isset( $this->request->get['mfilterIdx'] ) )
								$idx = (int) $this->request->get['mfilterIdx'];

							$data['mfilter_json'] = json_encode( MegaFilterCore::newInstance( $this, NULL )->getJsonData($baseTypes, $idx) );
						}

						$data['header'] = $data['column_left'] = $data['column_right'] = $data['content_top'] = $data['content_bottom'] = $data['footer'] = '';
					}
				}
				
				if( ! empty( $data['breadcrumbs'] ) && ! empty( $this->request->get['mfp'] ) ) {
					foreach( $data['breadcrumbs'] as $mfK => $mfBreadcrumb ) {
						$data['breadcrumbs'][$mfK]['href'] = $this->_removeMfpFromUrl( $data['breadcrumbs'][$mfK]['href'] );
					}
				}
			
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/special.tpl', $data));
		} else {

				if( isset( $this->request->get['mfilterAjax'] ) ) {
					$this->load->model( 'module/mega_filter' );
				
					if( class_exists( 'MegaFilterCore' ) ) {
						$settings	= $this->config->get('mega_filter_settings');
						$baseTypes	= array( 'stock_status', 'manufacturers', 'rating', 'attributes', 'price', 'options', 'filters' );

						if( isset( $this->request->get['mfilterBTypes'] ) ) {
							$baseTypes = explode( ',', $this->request->get['mfilterBTypes'] );
						}

						if( ! empty( $settings['calculate_number_of_products'] ) || in_array( 'categories:tree', $baseTypes ) ) {
							if( empty( $settings['calculate_number_of_products'] ) ) {
								$baseTypes = array( 'categories:tree' );
							}

							$this->load->model( 'module/mega_filter' );

							$idx = 0;

							if( isset( $this->request->get['mfilterIdx'] ) )
								$idx = (int) $this->request->get['mfilterIdx'];

							$data['mfilter_json'] = json_encode( MegaFilterCore::newInstance( $this, NULL )->getJsonData($baseTypes, $idx) );
						}

						$data['header'] = $data['column_left'] = $data['column_right'] = $data['content_top'] = $data['content_bottom'] = $data['footer'] = '';
					}
				}
				
				if( ! empty( $data['breadcrumbs'] ) && ! empty( $this->request->get['mfp'] ) ) {
					foreach( $data['breadcrumbs'] as $mfK => $mfBreadcrumb ) {
						$data['breadcrumbs'][$mfK]['href'] = $this->_removeMfpFromUrl( $data['breadcrumbs'][$mfK]['href'] );
					}
				}
			
			$this->response->setOutput($this->load->view('default/template/product/special.tpl', $data));
		}
	}
}
