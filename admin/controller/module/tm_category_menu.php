<?php

class ControllerModuleTmCategoryMenu extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('module/tm_category_menu');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/module');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            if (!isset($this->request->get['module_id'])) {
                $this->model_extension_module->addModule('tm_category_menu', $this->request->post);
            } else {
                $this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_add_image'] = $this->language->get('text_add_image');
        $data['text_remove_image'] = $this->language->get('text_remove_image');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_limit'] = $this->language->get('entry_limit');
        $data['entry_image'] = $this->language->get('entry_image');
        $data['entry_image_width'] = $this->language->get('entry_image_width');
        $data['entry_image_height'] = $this->language->get('entry_image_height');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = '';
        }

        if (isset($this->error['size'])) {
            $data['error_size'] = $this->error['size'];
        } else {
            $data['error_size'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/tm_category_menu', 'token=' . $this->session->data['token'], 'SSL')
        );

        if (!isset($this->request->get['module_id'])) {
            $data['action'] = $this->url->link('module/tm_category_menu', 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $data['action'] = $this->url->link('module/tm_category_menu', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
        }

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($module_info)) {
            $data['status'] = $module_info['status'];
        } else {
            $data['status'] = '';
        }

        if (isset($this->request->post['name'])) {
            $data['name'] = $this->request->post['name'];
        } elseif (!empty($module_info)) {
            $data['name'] = $module_info['name'];
        } else {
            $data['name'] = '';
        }

        if (isset($this->request->post['limit'])) {
            $data['limit'] = $this->request->post['limit'];
        } elseif (!empty($module_info)) {
            $data['limit'] = $module_info['limit'];
        } else {
            $data['limit'] = 5;
        }

        if (isset($this->request->post['image'])) {
            $data['image'] = $this->request->post['image'];
        } elseif (!empty($module_info) && isset($module_info['image'])) {
            $data['image'] = $module_info['image'];
        } else {
            $data['image'] = '';
        }
        $this->load->model('tool/image');

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        if (isset($this->request->post['image'])) {
            $image = array();
            foreach($this->request->post['image'] as $image_src){
                if (is_file(DIR_IMAGE . $image_src)){
                    $image[] = array(
                        'image' =>$this->model_tool_image->resize($image_src, 100, 100)
                    );
                }
            }

            $data['image_thumb'] = $image;
        } elseif (!empty($module_info) && isset($module_info['image'])) {
            $image_thumb = array();
            foreach ($module_info['image'] as $image) {
                if (is_file(DIR_IMAGE . $image)) {
                    $image_thumb[] = array(
                        'image' => $this->model_tool_image->resize($image, 100, 100)
                    );
                }
            }
            $data['image_thumb'] = $image_thumb;
        } else {
            $data['image_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        if (isset($this->request->post['image_width'])) {
            $data['image_width'] = $this->request->post['image_width'];
        } elseif (!empty($module_info)) {
            $data['image_width'] = $module_info['image_width'];
        } else {
            $data['image_width'] = '';
        }

        if (isset($this->request->post['image_height'])) {
            $data['image_height'] = $this->request->post['image_height'];
        } elseif (!empty($module_info)) {
            $data['image_height'] = $module_info['image_height'];
        } else {
            $data['image_height'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/tm_category_menu.tpl', $data));
    }

    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'module/tm_category_menu')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
            $this->error['name'] = $this->language->get('error_name');
        }

        if (!empty($this->request->post['image'])) {
            foreach (($this->request->post['image_width']) as $width) {
                if (!is_numeric($width)) {
                    $this->error['size'] = $this->language->get('error_size');
                    break;
                }
            }
            if (!isset($this->error['size'])) {
                foreach (($this->request->post['image_height']) as $height) {
                    if (!is_numeric($height)) {
                        $this->error['size'] = $this->language->get('error_size');
                        break;
                    }
                }
            }
        }

        return !$this->error;
    }
}