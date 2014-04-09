/* Converted to D from ../include/capi/cef_request_handler_capi.h by htod */
module cef_request_handler_capi;
// Copyright (c) 2014 Marshall A. Greenblatt. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//    * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//    * Neither the name of Google Inc. nor the name Chromium Embedded
// Framework nor the names of its contributors may be used to endorse
// or promote products derived from this software without specific prior
// written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// ---------------------------------------------------------------------------
//
// This file was generated by the CEF translator tool and should not edited
// by hand. See the translator.README.txt file in the tools directory for
// more information.
//

//C     #ifndef CEF_INCLUDE_CAPI_CEF_REQUEST_HANDLER_CAPI_H_
//C     #define CEF_INCLUDE_CAPI_CEF_REQUEST_HANDLER_CAPI_H_
//C     #pragma once

//C     #include "include/capi/cef_auth_callback_capi.h"
import cef_auth_callback_capi;
//C     #include "include/capi/cef_base_capi.h"
import cef_base_capi;
//C     #include "include/capi/cef_browser_capi.h"
import cef_browser_capi;
//C     #include "include/capi/cef_frame_capi.h"
//C     #include "include/capi/cef_request_capi.h"
//C     #include "include/capi/cef_resource_handler_capi.h"
import cef_resource_handler_capi;
//C     #include "include/capi/cef_response_capi.h"
//C     #include "include/capi/cef_web_plugin_capi.h"
import cef_web_plugin_capi;

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif


///
// Callback structure used for asynchronous continuation of quota requests.
///
//C     typedef struct _cef_quota_callback_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Continue the quota request. If |allow| is true (1) the request will be
  // allowed. Otherwise, the request will be denied.
  ///
//C       void (CEF_CALLBACK *cont)(struct _cef_quota_callback_t* self, int allow);

  ///
  // Cancel the quota request.
  ///
//C       void (CEF_CALLBACK *cancel)(struct _cef_quota_callback_t* self);
//C     } cef_quota_callback_t;
struct _cef_quota_callback_t
{
    cef_base_t base;
    void  function(_cef_quota_callback_t *self, int allow)cont;
    void  function(_cef_quota_callback_t *self)cancel;
}
extern (C):
alias _cef_quota_callback_t cef_quota_callback_t;


///
// Callback structure used for asynchronous continuation of url requests when
// invalid SSL certificates are encountered.
///
//C     typedef struct _cef_allow_certificate_error_callback_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Continue the url request. If |allow| is true (1) the request will be
  // continued. Otherwise, the request will be canceled.
  ///
//C       void (CEF_CALLBACK *cont)(
//C           struct _cef_allow_certificate_error_callback_t* self, int allow);
//C     } cef_allow_certificate_error_callback_t;
struct _cef_allow_certificate_error_callback_t
{
    cef_base_t base;
    void  function(_cef_allow_certificate_error_callback_t *self, int allow)cont;
}
alias _cef_allow_certificate_error_callback_t cef_allow_certificate_error_callback_t;


///
// Implement this structure to handle events related to browser requests. The
// functions of this structure will be called on the thread indicated.
///
//C     typedef struct _cef_request_handler_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Called on the UI thread before browser navigation. Return true (1) to
  // cancel the navigation or false (0) to allow the navigation to proceed. The
  // |request| object cannot be modified in this callback.
  // cef_load_handler_t::OnLoadingStateChange will be called twice in all cases.
  // If the navigation is allowed cef_load_handler_t::OnLoadStart and
  // cef_load_handler_t::OnLoadEnd will be called. If the navigation is canceled
  // cef_load_handler_t::OnLoadError will be called with an |errorCode| value of
  // ERR_ABORTED.
  ///
//C       int (CEF_CALLBACK *on_before_browse)(struct _cef_request_handler_t* self,
//C           struct _cef_browser_t* browser, struct _cef_frame_t* frame,
//C           struct _cef_request_t* request, int is_redirect);

  ///
  // Called on the IO thread before a resource request is loaded. The |request|
  // object may be modified. To cancel the request return true (1) otherwise
  // return false (0).
  ///
//C       int (CEF_CALLBACK *on_before_resource_load)(
//C           struct _cef_request_handler_t* self, struct _cef_browser_t* browser,
//C           struct _cef_frame_t* frame, struct _cef_request_t* request);

  ///
  // Called on the IO thread before a resource is loaded. To allow the resource
  // to load normally return NULL. To specify a handler for the resource return
  // a cef_resource_handler_t object. The |request| object should not be
  // modified in this callback.
  ///
//C       struct _cef_resource_handler_t* (CEF_CALLBACK *get_resource_handler)(
//C           struct _cef_request_handler_t* self, struct _cef_browser_t* browser,
//C           struct _cef_frame_t* frame, struct _cef_request_t* request);

  ///
  // Called on the IO thread when a resource load is redirected. The |old_url|
  // parameter will contain the old URL. The |new_url| parameter will contain
  // the new URL and can be changed if desired.
  ///
//C       void (CEF_CALLBACK *on_resource_redirect)(struct _cef_request_handler_t* self,
//C           struct _cef_browser_t* browser, struct _cef_frame_t* frame,
//C           const cef_string_t* old_url, cef_string_t* new_url);

  ///
  // Called on the IO thread when the browser needs credentials from the user.
  // |isProxy| indicates whether the host is a proxy server. |host| contains the
  // hostname and |port| contains the port number. Return true (1) to continue
  // the request and call cef_auth_callback_t::cont() when the authentication
  // information is available. Return false (0) to cancel the request.
  ///
//C       int (CEF_CALLBACK *get_auth_credentials)(struct _cef_request_handler_t* self,
//C           struct _cef_browser_t* browser, struct _cef_frame_t* frame, int isProxy,
//C           const cef_string_t* host, int port, const cef_string_t* realm,
//C           const cef_string_t* scheme, struct _cef_auth_callback_t* callback);

  ///
  // Called on the IO thread when JavaScript requests a specific storage quota
  // size via the webkitStorageInfo.requestQuota function. |origin_url| is the
  // origin of the page making the request. |new_size| is the requested quota
  // size in bytes. Return true (1) and call cef_quota_callback_t::cont() either
  // in this function or at a later time to grant or deny the request. Return
  // false (0) to cancel the request.
  ///
//C       int (CEF_CALLBACK *on_quota_request)(struct _cef_request_handler_t* self,
//C           struct _cef_browser_t* browser, const cef_string_t* origin_url,
//C           int64 new_size, struct _cef_quota_callback_t* callback);

  ///
  // Called on the UI thread to handle requests for URLs with an unknown
  // protocol component. Set |allow_os_execution| to true (1) to attempt
  // execution via the registered OS protocol handler, if any. SECURITY WARNING:
  // YOU SHOULD USE THIS METHOD TO ENFORCE RESTRICTIONS BASED ON SCHEME, HOST OR
  // OTHER URL ANALYSIS BEFORE ALLOWING OS EXECUTION.
  ///
//C       void (CEF_CALLBACK *on_protocol_execution)(
//C           struct _cef_request_handler_t* self, struct _cef_browser_t* browser,
//C           const cef_string_t* url, int* allow_os_execution);

  ///
  // Called on the UI thread to handle requests for URLs with an invalid SSL
  // certificate. Return true (1) and call
  // cef_allow_certificate_error_callback_t:: cont() either in this function or
  // at a later time to continue or cancel the request. Return false (0) to
  // cancel the request immediately. If |callback| is NULL the error cannot be
  // recovered from and the request will be canceled automatically. If
  // CefSettings.ignore_certificate_errors is set all invalid certificates will
  // be accepted without calling this function.
  ///
//C       int (CEF_CALLBACK *on_certificate_error)(struct _cef_request_handler_t* self,
//C           cef_errorcode_t cert_error, const cef_string_t* request_url,
//C           struct _cef_allow_certificate_error_callback_t* callback);

  ///
  // Called on the browser process IO thread before a plugin is loaded. Return
  // true (1) to block loading of the plugin.
  ///
//C       int (CEF_CALLBACK *on_before_plugin_load)(struct _cef_request_handler_t* self,
//C           struct _cef_browser_t* browser, const cef_string_t* url,
//C           const cef_string_t* policy_url, struct _cef_web_plugin_info_t* info);

  ///
  // Called on the browser process UI thread when a plugin has crashed.
  // |plugin_path| is the path of the plugin that crashed.
  ///
//C       void (CEF_CALLBACK *on_plugin_crashed)(struct _cef_request_handler_t* self,
//C           struct _cef_browser_t* browser, const cef_string_t* plugin_path);

  ///
  // Called on the browser process UI thread when the render process terminates
  // unexpectedly. |status| indicates how the process terminated.
  ///
//C       void (CEF_CALLBACK *on_render_process_terminated)(
//C           struct _cef_request_handler_t* self, struct _cef_browser_t* browser,
//C           cef_termination_status_t status);
//C     } cef_request_handler_t;
struct _cef_request_handler_t
{
    cef_base_t base;
    int  function(_cef_request_handler_t *self, _cef_browser_t *browser, _cef_frame_t *frame, _cef_request_t *request, int is_redirect)on_before_browse;
    int  function(_cef_request_handler_t *self, _cef_browser_t *browser, _cef_frame_t *frame, _cef_request_t *request)on_before_resource_load;
    _cef_resource_handler_t * function(_cef_request_handler_t *self, _cef_browser_t *browser, _cef_frame_t *frame, _cef_request_t *request)get_resource_handler;
    void  function(_cef_request_handler_t *self, _cef_browser_t *browser, _cef_frame_t *frame, cef_string_t *old_url, cef_string_t *new_url)on_resource_redirect;
    int  function(_cef_request_handler_t *self, _cef_browser_t *browser, _cef_frame_t *frame, int isProxy, cef_string_t *host, int port, cef_string_t *realm, cef_string_t *scheme, _cef_auth_callback_t *callback)get_auth_credentials;
    int  function(_cef_request_handler_t *self, _cef_browser_t *browser, cef_string_t *origin_url, int64 new_size, _cef_quota_callback_t *callback)on_quota_request;
    void  function(_cef_request_handler_t *self, _cef_browser_t *browser, cef_string_t *url, int *allow_os_execution)on_protocol_execution;
    int  function(_cef_request_handler_t *self, cef_errorcode_t cert_error, cef_string_t *request_url, _cef_allow_certificate_error_callback_t *callback)on_certificate_error;
    int  function(_cef_request_handler_t *self, _cef_browser_t *browser, cef_string_t *url, cef_string_t *policy_url, _cef_web_plugin_info_t *info)on_before_plugin_load;
    void  function(_cef_request_handler_t *self, _cef_browser_t *browser, cef_string_t *plugin_path)on_plugin_crashed;
    void  function(_cef_request_handler_t *self, _cef_browser_t *browser, cef_termination_status_t status)on_render_process_terminated;
}
alias _cef_request_handler_t cef_request_handler_t;


//C     #ifdef __cplusplus
//C     }
//C     #endif

//C     #endif  // CEF_INCLUDE_CAPI_CEF_REQUEST_HANDLER_CAPI_H_