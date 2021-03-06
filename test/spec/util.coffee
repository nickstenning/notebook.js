util = NotebookJS.util

describe 'NotebookJS.util', ->
  describe 'base64Encode()', ->
    it 'should base64 encode its input', ->
      expect(util.base64Encode("a test string")).to.equal("YSB0ZXN0IHN0cmluZw==")

  describe 'base64Decode()', ->
    it 'should base64 decode its input', ->
      expect(util.base64Decode("YSB0ZXN0IHN0cmluZw==")).to.equal("a test string")

  describe 'base64UrlEncode()', ->
    it 'should base64url encode its input', ->
      expect(util.base64UrlEncode("a test string")).to.equal("YSB0ZXN0IHN0cmluZw")

  describe 'base64UrlDecode()', ->
    it 'should base64url decode its input', ->
      expect(util.base64UrlDecode("YSB0ZXN0IHN0cmluZw")).to.equal("a test string")

  describe 'ModalDialog', ->
    md = null

    afterEach ->
      md.close()

    it 'should add a modal dialog to the document body', ->
      md = new util.ModalDialog()
      expect(md.element.parent()[0]).to.equal(document.body)

    it 'should set its content to the constructor argument', ->
      md = new util.ModalDialog("Hello world")
      expect(md.element.find('.modal-content').text()).to.equal("Hello world")

    it '#setContent() should set the dialog content', ->
      md = new util.ModalDialog("Hello world")
      md.setContent("No, it's my turn!")
      expect(md.element.find('.modal-content').text()).to.equal("No, it's my turn!")

    it '#close() should close the dialog', ->
      md = new util.ModalDialog("Hello world")
      md.close()
      expect(md.element.parent().length).to.equal(0)
