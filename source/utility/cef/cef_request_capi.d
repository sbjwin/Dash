/* Converted to D from ../include/capi/cef_request_capi.h by htod */
module cef_request_capi;
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

//C     #ifndef CEF_INCLUDE_CAPI_CEF_REQUEST_CAPI_H_
//C     #define CEF_INCLUDE_CAPI_CEF_REQUEST_CAPI_H_
//C     #pragma once

//C     #include "include/capi/cef_base_capi.h"
import cef_base_capi;

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     struct _cef_post_data_element_t;
//C     struct _cef_post_data_t;

///
// Structure used to represent a web request. The functions of this structure
// may be called on any thread.
///
//C     typedef struct _cef_request_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Returns true (1) if this object is read-only.
  ///
//C       int (CEF_CALLBACK *is_read_only)(struct _cef_request_t* self);

  ///
  // Get the fully qualified URL.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
//C       cef_string_userfree_t (CEF_CALLBACK *get_url)(struct _cef_request_t* self);

  ///
  // Set the fully qualified URL.
  ///
//C       void (CEF_CALLBACK *set_url)(struct _cef_request_t* self,
//C           const cef_string_t* url);

  ///
  // Get the request function type. The value will default to POST if post data
  // is provided and GET otherwise.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
//C       cef_string_userfree_t (CEF_CALLBACK *get_method)(struct _cef_request_t* self);

  ///
  // Set the request function type.
  ///
//C       void (CEF_CALLBACK *set_method)(struct _cef_request_t* self,
//C           const cef_string_t* method);

  ///
  // Get the post data.
  ///
//C       struct _cef_post_data_t* (CEF_CALLBACK *get_post_data)(
//C           struct _cef_request_t* self);

  ///
  // Set the post data.
  ///
//C       void (CEF_CALLBACK *set_post_data)(struct _cef_request_t* self,
//C           struct _cef_post_data_t* postData);

  ///
  // Get the header values.
  ///
//C       void (CEF_CALLBACK *get_header_map)(struct _cef_request_t* self,
//C           cef_string_multimap_t headerMap);

  ///
  // Set the header values.
  ///
//C       void (CEF_CALLBACK *set_header_map)(struct _cef_request_t* self,
//C           cef_string_multimap_t headerMap);

  ///
  // Set all values at one time.
  ///
//C       void (CEF_CALLBACK *set)(struct _cef_request_t* self, const cef_string_t* url,
//C           const cef_string_t* method, struct _cef_post_data_t* postData,
//C           cef_string_multimap_t headerMap);

  ///
  // Get the flags used in combination with cef_urlrequest_t. See
  // cef_urlrequest_flags_t for supported values.
  ///
//C       int (CEF_CALLBACK *get_flags)(struct _cef_request_t* self);

  ///
  // Set the flags used in combination with cef_urlrequest_t.  See
  // cef_urlrequest_flags_t for supported values.
  ///
//C       void (CEF_CALLBACK *set_flags)(struct _cef_request_t* self, int flags);

  ///
  // Set the URL to the first party for cookies used in combination with
  // cef_urlrequest_t.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
//C       cef_string_userfree_t (CEF_CALLBACK *get_first_party_for_cookies)(
//C           struct _cef_request_t* self);

  ///
  // Get the URL to the first party for cookies used in combination with
  // cef_urlrequest_t.
  ///
//C       void (CEF_CALLBACK *set_first_party_for_cookies)(struct _cef_request_t* self,
//C           const cef_string_t* url);

  ///
  // Get the resource type for this request. Accurate resource type information
  // may only be available in the browser process.
  ///
//C       cef_resource_type_t (CEF_CALLBACK *get_resource_type)(
//C           struct _cef_request_t* self);

  ///
  // Get the transition type for this request. Only available in the browser
  // process and only applies to requests that represent a main frame or sub-
  // frame navigation.
  ///
//C       cef_transition_type_t (CEF_CALLBACK *get_transition_type)(
//C           struct _cef_request_t* self);
//C     } cef_request_t;
struct _cef_request_t
{
    cef_base_t base;
    int  function(_cef_request_t *self)is_read_only;
    cef_string_userfree_t  function(_cef_request_t *self)get_url;
    void  function(_cef_request_t *self, cef_string_t *url)set_url;
    cef_string_userfree_t  function(_cef_request_t *self)get_method;
    void  function(_cef_request_t *self, cef_string_t *method)set_method;
    _cef_post_data_t * function(_cef_request_t *self)get_post_data;
    void  function(_cef_request_t *self, _cef_post_data_t *postData)set_post_data;
    void  function(_cef_request_t *self, cef_string_multimap_t headerMap)get_header_map;
    void  function(_cef_request_t *self, cef_string_multimap_t headerMap)set_header_map;
    void  function(_cef_request_t *self, cef_string_t *url, cef_string_t *method, _cef_post_data_t *postData, cef_string_multimap_t headerMap)set;
    int  function(_cef_request_t *self)get_flags;
    void  function(_cef_request_t *self, int flags)set_flags;
    cef_string_userfree_t  function(_cef_request_t *self)get_first_party_for_cookies;
    void  function(_cef_request_t *self, cef_string_t *url)set_first_party_for_cookies;
    cef_resource_type_t  function(_cef_request_t *self)get_resource_type;
    cef_transition_type_t  function(_cef_request_t *self)get_transition_type;
}
extern (C):
alias _cef_request_t cef_request_t;


///
// Create a new cef_request_t object.
///
//C     CEF_EXPORT cef_request_t* cef_request_create();
cef_request_t * cef_request_create(...);


///
// Structure used to represent post data for a web request. The functions of
// this structure may be called on any thread.
///
//C     typedef struct _cef_post_data_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Returns true (1) if this object is read-only.
  ///
//C       int (CEF_CALLBACK *is_read_only)(struct _cef_post_data_t* self);

  ///
  // Returns the number of existing post data elements.
  ///
//C       size_t (CEF_CALLBACK *get_element_count)(struct _cef_post_data_t* self);

  ///
  // Retrieve the post data elements.
  ///
//C       void (CEF_CALLBACK *get_elements)(struct _cef_post_data_t* self,
//C           size_t* elementsCount, struct _cef_post_data_element_t** elements);

  ///
  // Remove the specified post data element.  Returns true (1) if the removal
  // succeeds.
  ///
//C       int (CEF_CALLBACK *remove_element)(struct _cef_post_data_t* self,
//C           struct _cef_post_data_element_t* element);

  ///
  // Add the specified post data element.  Returns true (1) if the add succeeds.
  ///
//C       int (CEF_CALLBACK *add_element)(struct _cef_post_data_t* self,
//C           struct _cef_post_data_element_t* element);

  ///
  // Remove all existing post data elements.
  ///
//C       void (CEF_CALLBACK *remove_elements)(struct _cef_post_data_t* self);
//C     } cef_post_data_t;
struct _cef_post_data_t
{
    cef_base_t base;
    int  function(_cef_post_data_t *self)is_read_only;
    size_t  function(_cef_post_data_t *self)get_element_count;
    void  function(_cef_post_data_t *self, size_t *elementsCount, _cef_post_data_element_t **elements)get_elements;
    int  function(_cef_post_data_t *self, _cef_post_data_element_t *element)remove_element;
    int  function(_cef_post_data_t *self, _cef_post_data_element_t *element)add_element;
    void  function(_cef_post_data_t *self)remove_elements;
}
alias _cef_post_data_t cef_post_data_t;


///
// Create a new cef_post_data_t object.
///
//C     CEF_EXPORT cef_post_data_t* cef_post_data_create();
cef_post_data_t * cef_post_data_create(...);


///
// Structure used to represent a single element in the request post data. The
// functions of this structure may be called on any thread.
///
//C     typedef struct _cef_post_data_element_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Returns true (1) if this object is read-only.
  ///
//C       int (CEF_CALLBACK *is_read_only)(struct _cef_post_data_element_t* self);

  ///
  // Remove all contents from the post data element.
  ///
//C       void (CEF_CALLBACK *set_to_empty)(struct _cef_post_data_element_t* self);

  ///
  // The post data element will represent a file.
  ///
//C       void (CEF_CALLBACK *set_to_file)(struct _cef_post_data_element_t* self,
//C           const cef_string_t* fileName);

  ///
  // The post data element will represent bytes.  The bytes passed in will be
  // copied.
  ///
//C       void (CEF_CALLBACK *set_to_bytes)(struct _cef_post_data_element_t* self,
//C           size_t size, const void* bytes);

  ///
  // Return the type of this post data element.
  ///
//C       cef_postdataelement_type_t (CEF_CALLBACK *get_type)(
//C           struct _cef_post_data_element_t* self);

  ///
  // Return the file name.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
//C       cef_string_userfree_t (CEF_CALLBACK *get_file)(
//C           struct _cef_post_data_element_t* self);

  ///
  // Return the number of bytes.
  ///
//C       size_t (CEF_CALLBACK *get_bytes_count)(struct _cef_post_data_element_t* self);

  ///
  // Read up to |size| bytes into |bytes| and return the number of bytes
  // actually read.
  ///
//C       size_t (CEF_CALLBACK *get_bytes)(struct _cef_post_data_element_t* self,
//C           size_t size, void* bytes);
//C     } cef_post_data_element_t;
struct _cef_post_data_element_t
{
    cef_base_t base;
    int  function(_cef_post_data_element_t *self)is_read_only;
    void  function(_cef_post_data_element_t *self)set_to_empty;
    void  function(_cef_post_data_element_t *self, cef_string_t *fileName)set_to_file;
    void  function(_cef_post_data_element_t *self, size_t size, void *bytes)set_to_bytes;
    cef_postdataelement_type_t  function(_cef_post_data_element_t *self)get_type;
    cef_string_userfree_t  function(_cef_post_data_element_t *self)get_file;
    size_t  function(_cef_post_data_element_t *self)get_bytes_count;
    size_t  function(_cef_post_data_element_t *self, size_t size, void *bytes)get_bytes;
}
alias _cef_post_data_element_t cef_post_data_element_t;


///
// Create a new cef_post_data_element_t object.
///
//C     CEF_EXPORT cef_post_data_element_t* cef_post_data_element_create();
cef_post_data_element_t * cef_post_data_element_create(...);


//C     #ifdef __cplusplus
//C     }
//C     #endif

//C     #endif  // CEF_INCLUDE_CAPI_CEF_REQUEST_CAPI_H_