"======================================================================
|
|   Iliad.ILFormElementElement class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
|
| This file is part of the Iliad framework.
|
| Permission is hereby granted, free of charge, to any person obtaining
| a copy of this software and associated documentation files (the 
| 'Software'), to deal in the Software without restriction, including 
| without limitation the rights to use, copy, modify, merge, publish, 
| distribute, sublicense, and/or sell copies of the Software, and to 
| permit persons to whom the Software is furnished to do so, subject to 
| the following conditions:
|
| The above copyright notice and this permission notice shall be 
| included in all copies or substantial portions of the Software.
|
| THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, 
| EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
| MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
| IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
| CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
| TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
| SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  
|
 ======================================================================"



ILHTMLBuilderElement subclass: ILFormElementElement [

    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    accesskey: aCharacter [
	<category: 'accessing'>
	self attributeAt: 'accesskey' put: aCharacter greaseString
    ]

    action: aBlock [
	<category: 'accessing attributes'>
	| action |
	action := self session registerActionFor: aBlock.
	self name: action key
    ]

    name [
	<category: 'accessing attributes'>
	^self attributeAt: 'name'
    ]

    name: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'name' put: aString
    ]

    readonly: aBoolean [
	<category: 'accessing attributes'>
	self attributeAt: 'readonly' put: aBoolean greaseString
    ]

    beSubmitOnChange [
	<category: 'accessing attributes'>
	self beSubmitOnEvent: 'change'
    ]

    beSubmitOnClick [
	<category: 'accessing attributes'>
	self beSubmitOnEvent: 'click'
    ]
   
    beSubmitOnEvent: aString [
	<category: 'accessing attributes'>
	self onEvent: aString add: 'iliad.evaluateFormElementAction(this)'
    ]

    disabled: aBoolean [
	<category: 'accessing attributes'>
	aBoolean ifTrue: [
	self attributeAt: 'disabled' put: 'disabled']
    ]
    
    disabled [
	<category: 'accessing attributes'>
	self disabled: true
    ]
]


