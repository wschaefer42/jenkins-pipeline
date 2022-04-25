const hobbies = require('../hobbies')
describe('API unit test suite', () => {
    describe('getHobbies', () => {
        const list = hobbies.getHobbies()
        it('returns 5 hobbies', () => {
            console.log('getHobbies length test')
            expect(list.length).toEqual(5)
        })
        it('returns jogging as first hobby', () => {
            console.log('getHobbies first == jogging')
            expect(list[0]).toEqual('jogging')
        })
    })
})