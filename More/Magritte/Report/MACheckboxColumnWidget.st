"======================================================================
|
|   Magritte.MACheckboxColumnWidget class definition
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



MASelectionColumnWidget subclass: MACheckboxColumnWidget [
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Report'>

    buildCellFormContent: anObject [
	<category: 'building'>
	^[:e | 
	    e checkbox
		checked: (self isSelected: anObject);
		action: [:value | self selectRow: anObject value: value]]
    ]

    defaultSelection [
	<category: 'accessing-defaults'>
	^Set new
    ]

    defaultStringDeselected [
	<category: 'accessing-defaults'>
	^self webdings: 'c'
    ]

    defaultStringSelected [
	<category: 'accessing-defaults'>
	^self webdings: 'g'
    ]

    deselectRow: anObject [
	<category: 'actions'>
	self selection remove: anObject ifAbsent: nil.
	self report markDirty
    ]

    selectRow: anObject [
	<category: 'actions'>
	self selection add: anObject.
	self report markDirty
    ]

    isSelected: anObject [
	<category: 'testing'>
	^self selection includes: anObject
    ]
]

