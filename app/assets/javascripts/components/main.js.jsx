let Main = React.createClass({
  getInitialState() {
    return {
      description: this.props.description,
      email: this.props.email,
      phone: this.props.phone,
      country: this.props.country,
      state_province_county: this.props.state_province_county,
      city: this.props.city,
      countries_list: this.props.countries_list,
      show_email: this.props.show_email,
      show_phone_number: this.props.show_phone_number
    }
  },

  handleUpdate(updated_user_info) {
    let data = {};
    data[this.props.user_type_name] = updated_user_info;

    $.ajax({
      url: `/${this.props.user_type_name}s`,
      type: 'PATCH',
      dataType: 'JSON',
      data: data
    });
  },

  updateMain(updated_user_info) {
    this.setState(updated_user_info);
  },

  status_icon(data) {
    if(data){
      return (
        <i className="fa fa-globe" aria-hidden="true"></i>
      )
    } else {
      return (
        <i className="fa fa-lock" aria-hidden="true"></i>
      )
    }
  },

  render() {
    return (
      <div>
        <Description
          description={this.state.description}
          handleUpdate={this.handleUpdate}
          updateMain={this.updateMain}
        />
        <ContactInfo
          email={this.state.email}
          phone={this.state.phone}
          handleUpdate={this.handleUpdate}
          updateMain={this.updateMain}
          show_email={this.state.show_email}
          show_phone_number={this.state.show_phone_number}
          status_icon={this.status_icon}
        />
        <Address
          country={this.state.country}
          state_province_county={this.state.state_province_county}
          city={this.state.city}
          user_type_name={this.state.user_type_name}
          handleUpdate={this.handleUpdate}
          updateMain={this.updateMain}
          countries_list={this.state.countries_list}
        />
      </div>
    )
  }
});
