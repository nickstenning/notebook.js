(function() {
  var $, B64, ModalDialog, NotebookJS, base64Decode, base64Encode, base64UrlDecode, base64UrlEncode, root, _ref, _ref2;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  NotebookJS = root.NotebookJS = (_ref = root.NotebookJS) != null ? _ref : {};

  NotebookJS.util = (_ref2 = NotebookJS.util) != null ? _ref2 : {};

  $ = jQuery;

  B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

  base64Decode = function(data) {
    var ac, bits, dec, h1, h2, h3, h4, i, o1, o2, o3, tmp_arr;
    if (typeof atob !== "undefined" && atob !== null) {
      return atob(data);
    } else {
      i = 0;
      ac = 0;
      dec = "";
      tmp_arr = [];
      if (!data) return data;
      data += '';
      while (i < data.length) {
        h1 = B64.indexOf(data.charAt(i++));
        h2 = B64.indexOf(data.charAt(i++));
        h3 = B64.indexOf(data.charAt(i++));
        h4 = B64.indexOf(data.charAt(i++));
        bits = h1 << 18 | h2 << 12 | h3 << 6 | h4;
        o1 = bits >> 16 & 0xff;
        o2 = bits >> 8 & 0xff;
        o3 = bits & 0xff;
        if (h3 === 64) {
          tmp_arr[ac++] = String.fromCharCode(o1);
        } else if (h4 === 64) {
          tmp_arr[ac++] = String.fromCharCode(o1, o2);
        } else {
          tmp_arr[ac++] = String.fromCharCode(o1, o2, o3);
        }
      }
      return tmp_arr.join('');
    }
  };

  base64Encode = function(data) {
    var ac, bits, enc, h1, h2, h3, h4, i, o1, o2, o3, r, tmp_arr;
    if (typeof btoa !== "undefined" && btoa !== null) {
      return btoa(data);
    } else {
      i = 0;
      ac = 0;
      enc = "";
      tmp_arr = [];
      if (!data) return data;
      data += '';
      while (i < data.length) {
        o1 = data.charCodeAt(i++);
        o2 = data.charCodeAt(i++);
        o3 = data.charCodeAt(i++);
        bits = o1 << 16 | o2 << 8 | o3;
        h1 = bits >> 18 & 0x3f;
        h2 = bits >> 12 & 0x3f;
        h3 = bits >> 6 & 0x3f;
        h4 = bits & 0x3f;
        tmp_arr[ac++] = B64.charAt(h1) + B64.charAt(h2) + B64.charAt(h3) + B64.charAt(h4);
      }
      enc = tmp_arr.join('');
      r = data.length % 3;
      return (r ? enc.slice(0, r - 3) : enc) + '==='.slice(r || 3);
    }
  };

  base64UrlDecode = function(data) {
    var m;
    m = data.length % 4;
    if (m !== 0) data += Array(5 - m).join('=');
    data = data.replace(/-/g, '+');
    data = data.replace(/_/g, '/');
    return base64Decode(data);
  };

  base64UrlEncode = function(data) {
    var chop;
    data = base64Encode(data);
    chop = data.indexOf('=');
    if (chop !== -1) data = data.slice(0, chop);
    data = data.replace(/\+/g, '-');
    data = data.replace(/\//g, '_');
    return data;
  };

  ModalDialog = (function() {

    function ModalDialog(content) {
      var _this = this;
      this.element = $("<div class=\"modal\">\n  <div class=\"modal-inner\">\n    <a class=\"close\">&times;</a>\n    <div class=\"modal-content\"></div>\n  </div>\n</div>");
      this.element.appendTo(document.body);
      this.element.on('click', '.close', function() {
        return _this.close();
      });
      if (content) this.setContent(content);
    }

    ModalDialog.prototype.setContent = function(content) {
      return this.element.find('.modal-content').html(content);
    };

    ModalDialog.prototype.close = function() {
      return this.element.remove();
    };

    return ModalDialog;

  })();

  NotebookJS.util.base64Encode = base64Encode;

  NotebookJS.util.base64Decode = base64Decode;

  NotebookJS.util.base64UrlEncode = base64UrlEncode;

  NotebookJS.util.base64UrlDecode = base64UrlDecode;

  NotebookJS.util.ModalDialog = ModalDialog;

}).call(this);
