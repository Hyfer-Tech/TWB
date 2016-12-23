let Main = React.createClass({
  getInitialState() {
    return {
      description: this.props.description,
      email: this.props.email,
      phone: this.props.phone,
      country: this.props.country,
      state_province_county: this.props.state_province_county,
      city: this.props.city
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

  render() {
    return (
      <div>
        <Description
          description={this.state.description}
          handleUpdate={this.handleUpdate}
        />
        <ContactInfo
          email={this.state.email}
          phone={this.state.phone}
          handleUpdate={this.handleUpdate}
        />
        <Address
          country={this.state.country}
          state_province_county={this.state.state_province_county}
          city={this.state.city}
          user_type_name={this.state.user_type_name} />
      </div>
    )
  }
});
