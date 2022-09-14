

export class ImCalendar{
    constructor(){
        this.today = new Date();
        this.date = new Date();
        this.cnt = 0;
        this.row = undefined;
        this.cell = undefined;
        this.isPrevNext = undefined;
        this.HL_today = false;
    }

    /* 🔰 */
    startDraw(obj){
        const targetName = obj.target;
        const target = document.getElementById(targetName);
        const btn_prevNext = obj.prevNext ?? true;
        this.HL_today = obj.HL_today ?? false;

        this.reset_sect(target);
        this.makeYM(target,btn_prevNext);
        this.make_calendar(target,obj);
    }

    reset_sect(target){
        target.classList.add('sect_cal');
        target.innerHTML = '';
    }//reset_sect

    /* 🔰 */
    makeYM(target,btn_prevNext){
        const article_YM = document.createElement('ARTICLE');
        article_YM.classList.add('YM');

        if(btn_prevNext){
            article_YM.innerHTML = `
            <button class="btn_month-prev" data-month="prev">◀</button>
            <div class="title">YYYY년 MM달</div>
            <button class="btn_month-next" data-month="next">▶</button>
            `;
        }else{
            article_YM.innerHTML = `
            <div class="title">YYYY년 MM달</div>
            `;
        }

        target.appendChild(article_YM);

        article_YM.addEventListener('click', e => {this.onClick(e)});
    }//reset_sect

    /* 🔰 */
    make_calendar(target,obj){
        const tbl = document.createElement('TABLE');
        tbl.classList.add('tbl_cal');
        target.appendChild(tbl);
        
        this.make_thead(tbl);
        this.display_calendar(tbl,obj);
    }//make_calendar

    make_thead(tbl){
        const content = `
            <thead>
                <tr>
                    <th>SUN</th> <th>MON</th> <th>TUE</th> <th>WED</th> <th>THU</th> <th>FRI</th> <th>SAT</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                </tr>
            </tbody>
        `;
        tbl.innerHTML = content;
    }//make_thead

    display_calendar(tbl){
        const tbody = tbl.getElementsByTagName('TBODY')[0];

        const doMonth = new Date(this.today.getFullYear(), this.today.getMonth(), 1);
        const lastDate = new Date(this.today.getFullYear(), this.today.getMonth() + 1, 0);
       
        this.setYM(tbl)
        this.reset_tbody(tbody, doMonth);
        this.draw_dates(tbody,lastDate);
        
    }//display_calendar

    setYM(tbl){
        const title = tbl.previousElementSibling.getElementsByClassName('title')[0];
        title.innerHTML = `${this.today.getFullYear()}년 ${this.today.getMonth()+1}월`;
    }//setYM

    reset_tbody(tbody, doMonth){ 
        tbody.innerHTML = '';
        this.row = null;
        this.row = tbody.insertRow();
        this.cnt = 0;

        for(let i=0; i<doMonth.getDay(); i++){
            this.cell = this.row.insertCell();
            this.cnt++;
        }
    }//reset_tbody

    draw_dates(tbody,lastDate){
        for(let i=1; i<=lastDate.getDate(); i++){
            this.cell = this.row.insertCell();
            this.cell.innerHTML = i;
            this.cnt++;

            if(this.cnt % 7 == 1){this.cell.classList.add('sunday');}
        
            if(this.cnt % 7 == 0){
                this.cell.classList.add('saturday');
                this.row = tbody.insertRow();
            }//if

            if(this.HL_today){this.draw_today(i);}
        }//for
    }//draw_dates

    onClick(e){
        e = e || window.event;
        if(e.target.tagName != "BUTTON"){return;}

        this.isPrevNext = e.target.dataset.month == "prev" ? -1 : 1;

        this.today = new Date(this.today.getFullYear(),this.today.getMonth() + this.isPrevNext, this.today.getDate());

        const tbl = e.currentTarget.nextElementSibling;
        
        this.display_calendar(tbl);
    }//onClick

    draw_today(i){
        const is_today_true = this.is_today_true(i);
        if(is_today_true){this.cell.classList.add('today');}
    }//draw_this.today

    is_today_true(i){
        if (this.today.getFullYear() == this.date.getFullYear() && 
            this.today.getMonth() == this.date.getMonth() && 
            i == this.date.getDate()){
            return true;
        }//if
    }//is_this.today_true

}//[CLASS] : ImCalendar
