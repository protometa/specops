
require 'should'

op1 = require('./specops.coffee').op1
op2 = require('./specops.coffee').op2

exp = Math.exp
log = Math.log

round = (num,places) ->
	factor = Math.pow(10, places)
	Math.round(num * factor) / factor

describe 'op1', ->

	describe 'addition', ->

		it 'does binary op', ->
			op1(1)(2,3).should.equal(5)

		it 'does series', ->
			op1(1)(3,5,7).should.equal(15)


	describe 'multiplication', ->

		it 'does binary op', ->
			op1(2)(3,5).should.equal(15)

		it 'does series', ->
			op1(2)(3,5,7).should.equal(105)


	describe 'exponentiation', ->

		it 'does binary op', ->
			op1(3)(2,exp(3)).should.equal(8)

		it 'does series', ->
			op1(3,2)(2,4,8).should.equal(64)

		it 'commutes', ->
			round( op1(3)(exp(3),2), 5).should.equal(8)

		it 'associates', ->
			round( op1(3,2)(4,8,2), 5).should.equal(64)

		it 'combines', ->
			# x ^ a * x ^ b = x ^ (a * b) = a ^ x * b ^ x = (a * b) ^ x
			x = 5; a = 2; b = 3
			console.log op1(2)( op1(3)( x, a ), op1(3)( x, b ) )
			round( op1(2)( op1(3)( x, a ), op1(3)( x, b ) ), 5).should.equal round( op1(3)( x, op1(2)( a, b )), 5)

	describe 'inverse exponentiation', ->

		it 'does binary op', ->
			# 3 ^ 4 = 9, 9 v 4 = 3
			round( op1(-3,2)(9,4), 5).should.equal(3)

		it 'reverse commutes', ->
			# 9 v 3 = 4
			round( op1(-3,2)(9,3), 5).should.equal(4)

		it 'inverts', ->
			# 9 v 3 = 9 ^ (2 v 3)
			op1(-3,2)(9,3).should.equal round( op1(3,2)(9, op1(-3,2)(2,3) ), 5)



describe 'op2', ->

	describe 'addition', ->

		it 'adds whole numbers', ->
			op2(1)(2,3).should.equal(5)

		# it 'adds with nonstandard identity', ->
		# 	op2(1,2)(2,3).should.equal(3)

	describe 'multiplication', ->

		it 'multiplies whole numbers', ->
			op2(2)(2,3).should.equal(6)

		# it 'multiplies with nonstandard identity', ->
		# 	op2(2,2)(2,3).should.equal(3)

	describe 'exponentiation', ->

		it 'exponents whole numbers', ->
			op2(3)(2,3).should.equal(8)

	describe 'quateration', ->

		it 'quaterates whole numbers', ->
			op2(4)(2,3).should.equal(16)

	describe 'quinteration', ->

		it 'quinterates whole numbers', ->
			op2(5)(2,3).should.equal(256)








