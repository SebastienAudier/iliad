"======================================================================
|
|   Magritte.MARelationWidget class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from Magritte-Seaside written by Lukas Renggli 
| http://source.lukas-renggli.ch/magritte.
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



MAElementWidget subclass: MARelationWidget [
    | selected |
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Widgets'>

    classes [
	<category: 'accessing-dynamic'>
	^self description classes
    ]

    editorFor: anObject [
	<category: 'private'>
	^(self description reference asWidgetOn: anObject)
	    addValidatedForm;
	    yourself
    ]

    selectButtonContents [
	<category: 'building-tools'>
	self subclassResponsibility
    ]

    selectListContents [
	<category: 'building-tools'>
	^[:e | 
	    | select |
	    self classes size > 1 
		ifTrue: 
		    [select := e select.
		    self classes do: 
			[:each | 
			    (select option)
				text: each label;
				selected: each = self selected;
				action: [self selected: each]]].
	    self classes notEmpty ifTrue: [e build: self selectButtonContents]]
    ]

    selected [
	<category: 'accessing'>
	^selected ifNil: [selected := self classes first]
    ]

    selected: aClass [
	<category: 'accessing'>
	selected := aClass
    ]
]

