

/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Endurance Lab",
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      message: "Signup here",
      first_name: "",
      last_name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      race_date: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.first_name,
        last_name: this.last_name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation,
        race_date: this.race_date
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/dashboard");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};




var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};



var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};


var DashboardPage = {
  template: "#dashboard-page",
  data: function() {
    return {
      message: "Your 140.6 Training Plan",
      workouts: [],

    };
  },
  created: function() {
    axios.get('/api/workouts').then(function(response) {
      console.log(response.data, this);
      this.workouts = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var CalendarPage = {
  template: "#calendar-page",
  data: function() {
    return {
      message: "Your 140.6 Training Plan",
      myEvents: [
      {
          title: 'Rest Day',
          start: '2014-06-03'
        },
        {
          title: 'Open Water Swim',
          start: '2014-06-07',
          end: '2014-06-10'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2014-06-09T16:00:00'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2014-06-16T16:00:00'
        },
        {
          title: 'Meeting',
          start: '2014-06-12T10:30:00',
          end: '2014-06-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2014-06-12T12:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2014-06-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2014-06-28'
        }
      ],

    };
  },
  created: function() {
    axios.get('/api/workouts').then(function(response) {
      console.log(response.data, this);
      this.myEvents = [
      {
        title: response.data[0].phase,
        start: response.data[0].start_date
      }
      ];
      $(document).ready(function() {
        console.log(this)
        $('#calendar').fullCalendar({
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          },
          defaultDate: '2018-08-08',
          defaultView: 'month',
          selectable: true,
          selectHelper: true,
          editable: true,
          events: this.myEvents
        });

      }.bind(this));
    }.bind(this));
    
    
  },
  methods: {},
  computed: {}
};
var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/dashboard", component: DashboardPage },
    { path: "/calendar", component: CalendarPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});

