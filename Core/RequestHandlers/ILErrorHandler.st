"======================================================================
|
|   Iliad.ILErrorHandler class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
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



ILRequestHandler subclass: ILErrorHandler [
    | error |
    
    <category: 'Iliad-Core-RequestHandlers'>
    <comment: nil>

    error [
	<category: 'accessing'>
	^error
    ]

    error: anError [
	<category: 'accessing'>
	error := anError
    ]

    newResponse [
	<category: 'accessing'>
	^ILResponse new
	    status: 500;
	    yourself
    ]

    produceResponse [
	<category: 'responding'>
	self application isDebugMode ifTrue: [
	    self produceDebugResponse].
	self application isVerboseMode ifTrue: [
	    self produceVerboseResponse].
	self application isDeploymentMode ifTrue: [
	    self produceDeploymentResponse]
    ]

    produceDeploymentResponse [
	<category: 'responding'>
	self respond: [:response | 
	    response nextPutAll: '<html><h1>Error 500: Internal server error</h1></html>']
    ]

    produceDebugResponse [
	<category: 'responding'>
	self error resignalAsUnhandled: self error messageText
    ]

    produceVerboseResponse [
	<category: 'responding'>
	| info |
	info := WriteStream on: ''. 
	self respond: [:response || page e |
	    response nextPutAll: (String streamContents: [:stream |
		page := ILXHTMLPage new.
		page body h1: 'Internal Error';
		    h2: self error description;
		    h3: self error messageText.
		self error examineOn: info.
		info nextPut: Character cr.
		self error resumeContext backtraceOn: info.
		page body pre: info contents.
		Transcript show: info contents; cr.
		page build printHtmlOn: stream])]
    ]
]

Signal extend [
    resumeContext [
	^resumeBlock outerContext home
    ]
]