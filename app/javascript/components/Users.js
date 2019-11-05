import React from "react";
import PropTypes from "prop-types";
import MaterialTable from 'material-table';
import _ from 'lodash';
class Users extends React.Component {
  render () {
    let columnList = Object.keys(this.props.users[0]);
    let columns = _.map(columnList, (name, index) => {
      return {field: name, title: name};
    });
    return (
      <div>
        <MaterialTable
        title="All Users"
        columns={columns}
        data={this.props.users}
        />
      </div>
      
    );
  }
}

Users.propTypes = {
  users: PropTypes.array
};

export default Users
