package hret

type HttpPanicFunc func()

func HttpPanic(f ...HttpPanicFunc) {
	if r := recover(); r != nil {
		for _, val := range f {
			val()
		}
	}
}
