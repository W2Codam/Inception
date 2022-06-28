const skillsTitle = document.querySelector('#skills-title')
const header = document.querySelector('header')
const titleOffset = findOffset(skillsTitle);

const animatedArrow = document.querySelector('#arrow-animated')

document.body.addEventListener('scroll', () => {

    var bodyScrollTop = document.documentElement.scrollTop || document.body.scrollTop;

    if (bodyScrollTop > titleOffset.top) {
        header.classList.add('visible')
        animatedArrow.classList.add('hidden')
    }
    else {
        header.classList.remove('visible')
        animatedArrow.classList.remove('hidden')
    }
})

function findOffset(element) {
    var top = 0, left = 0;

    do {
        top += element.offsetTop || 0;
        left += element.offsetLeft || 0;
        element = element.offsetParent;
    } while (element);

    return {
        top: top,
        left: left
    };
}