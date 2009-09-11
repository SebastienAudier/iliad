"======================================================================
|
|   Iliad.WidgetTabs class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
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


UIWidget subclass: WidgetTabs [
    | widgets labels hashes selectedWidget |
    
    <category: 'Iliad-More-UI'>
    <comment: 'Usage example:

Tabs new
    labels: #(''Counter 1'' ''Counter 2'');
    widgets: {Counter new. Counter new}'>

    contents [
	<category: 'building'>
	^[:e |
	    e build: self tabsContents.
	    e div
		class: 'contents';
		add: self selectedWidget build]
    ]

    tabsContents [
	<category: 'building'>
	^[:e || div ul |
	    div := e div class: 'tabs'.
	    ul := div unorderedList.
	    self widgets do: [:each || li |
		li := ul listItem.
		li anchor
		    text: (self labelFor: each);
		    action: [self selectWidget: each]
		    hash: (self hashFor: each).
		self selectedWidget = each ifTrue: [
		    li class: 'selected']]]
    ]

    labels [
	<category: 'accessing'>
	^labels
    ]

    labels: aCollection [
	"aCollection -- of strings -- must have the same size as 
	widgets collection"
	<category: 'accessing'>

	labels := aCollection
    ]

    hashes [
	<category: 'accessing'>
	^hashes ifNil: [#()]
    ]

    hashes: aCollection [
	"aCollection -- of strings -- must have the same size as 
	widgets collection"
	<category: 'accessing'>

	hashes := aCollection
    ]

    hashFor: aWidget [
	<category: 'accessing'>
	^self hashes 
	    at: (self widgets indexOf: aWidget) 
	    ifAbsent: ['']
    ]

    labelFor: aWidget [
	<category: 'accessing'>
	^self labels
	    at: (self widgets indexOf: aWidget) 
	    ifAbsent: ['']
    ]

    selectedWidget [
	<category: 'accessing'>
	^selectedWidget ifNil: [self widgets first]
    ]

    widgets [
	<category: 'accessing'>
	^widgets
    ]

    widgets: aCollection [
	"aCollection of widgets to be displayed in the tabs.
	Each widget has an associated label, set with #labels: method"
	<category: 'accessing'>

	widgets := aCollection
    ]

    selectWidget: aWidget [
	<category: 'actions'>
	selectedWidget := aWidget.
	self markDirty
    ]
]
