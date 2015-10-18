
module.exports = spec =

	op1: (order, identity) ->
		(args...) ->
			args.reduce (a, b) ->
				switch order
					when 1
						a + (b - (identity ? 0))
					when 2
						a * (b / (identity ? 1))
					when 3
						Math.pow( a, (Math.log(b) / Math.log(identity ? Math.E)) )
					when -3
						Math.pow( identity, Math.log(a) / Math.log(b) )


	op2: (order) ->
		(a,b) ->
			if order is 1
				a + b
			else if order > 1
				r = a
				while b > 1
					b--
					r = spec.op2(order-1)(r,a)
				return r


















