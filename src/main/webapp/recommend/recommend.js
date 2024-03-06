function ChangeColor(o) {
    if (o.classList.contains("clicked")) {
        o.classList.remove("clicked");
    } else {
        o.classList.add("clicked");
    }
}

function ChangeColorOnly(o) {
    const btnNations = document.querySelectorAll('.nations');

    btnNations.forEach(btn => {
        btn.classList.remove('clicked');
    });

    o.classList.add('clicked');
}

function SetGenresId(Obj, GenresId) {
    Obj.setAttribute('GenresId', GenresId);
}

function SetNationsId(Obj, NationsId) {
    Obj.setAttribute('NationsId', NationsId);
}

function SetSeasonsId(Obj, SeasonsId) {
    Obj.setAttribute('SeasonsId', SeasonsId);
}

function SetTimezonesId(Obj, TimezonesId) {
    Obj.setAttribute('TimezonesId', TimezonesId);
}

function SetCircumsId(Obj, CircumsId) {
    Obj.setAttribute('CircumsId', CircumsId);
}

function IsCheckGenresAll() {
    let Objs = document.querySelectorAll('.genres');
    let Obj = document.querySelector('#genres');
    let ObjsLen = Objs.length;
    let GenresList = '';

    for (i = 0; i < ObjsLen; i++) {
        if (Objs[i].classList.contains("clicked")) {
            if (Objs[i].getAttribute('GenresId') != null) GenresList = GenresList + ',' + Objs[i].getAttribute('GenresId');
        }
    }

    Obj.value = GenresList;
}

function IsCheckNationsAll() {
    let Objs = document.querySelectorAll('.nations');
    let Obj = document.querySelector('#nations');
    let ObjsLen = Objs.length;
    let NationsList = null;

    for (i = 0; i < ObjsLen; i++) {
        if (Objs[i].classList.contains("clicked")) {
            if (Objs[i].getAttribute('NationsId') != null) NationsList = Objs[i].getAttribute('NationsId');
        }
    }

    Obj.value = NationsList;
}

function IsCheckSeasonsAll() {
    let Objs = document.querySelectorAll('.seasons');
    let Obj = document.querySelector('#seasons');
    let ObjsLen = Objs.length;
    let SeasonsList = '';

    for (i = 0; i < ObjsLen; i++) {
        if (Objs[i].classList.contains("clicked")) {
            if (Objs[i].getAttribute('SeasonsId') != null) SeasonsList = SeasonsList + ',' + Objs[i].getAttribute('SeasonsId');
        }
    }

    Obj.value = SeasonsList;
}

function IsCheckTimezonesAll() {
    let Objs = document.querySelectorAll('.timezones');
    let Obj = document.querySelector('#timezones');
    let ObjsLen = Objs.length;
    let TimezonesList = '';

    for (i = 0; i < ObjsLen; i++) {
        if (Objs[i].classList.contains("clicked")) {
            if (Objs[i].getAttribute('TimezonesId') != null) TimezonesList = TimezonesList + ',' + Objs[i].getAttribute('TimezonesId');
        }
    }

    Obj.value = TimezonesList;
}

function IsCheckCircumsAll() {
    let Objs = document.querySelectorAll('.circums');
    let Obj = document.querySelector('#circums');
    let ObjsLen = Objs.length;
    let CircumsList = '';

    for (i = 0; i < ObjsLen; i++) {
        if (Objs[i].classList.contains("clicked")) {
            if (Objs[i].getAttribute('CircumsId') != null) CircumsList = CircumsList + ',' + Objs[i].getAttribute('CircumsId');
        }
    }

    Obj.value = CircumsList;
}

function check() {
    var nation = document.getElementById('nations');
    if (nation == '' || nation == null || nation == ' ') {
        return false;
    }
}
