package fr.inria.diverse.docl.tests


import org.junit.runner.RunWith
import org.junit.Test

import javax.inject.Inject

import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.util.ParseHelper

import fr.inria.diverse.docl.DOclInjectorProvider
import fr.inria.diverse.docl.docl.Model
import org.junit.Assert

@RunWith(XtextRunner)
@InjectWith(DOclInjectorProvider)
class SampleTest {
	
	@Inject
	extension ParseHelper<Model>
	
	@Test
	def void testIt() {
		val model = '''
		Hello A!
		Hello B!
		'''.parse
		Assert.assertEquals(0, model.eResource.errors.size)
	
	}
	
	@Test
	def void testItNeg() {
		val model = '''
		Hello A
		'''.parse
		Assert.assertEquals(1, model.eResource.errors.size)
	}
	
}